class IngredientsController < ApplicationController
  before_action :require_logged_in

  PAGE_SIZE = 10

  def index
    respond_to do |format|
      format.js { 
        ingredients = Ingredient.order(:name).where("name like ?", "%#{params[:term]}%")
        render json: ingredients.map(&:name)
      }
      format.html {
        @sort = params[:sort] ? params[:sort] : 'name'
        @dir = params[:dir] ? params[:dir] : 'asc'

        sort_sql = 'id' if @sort == 'id'
        sort_sql = 'lower(name)' if @sort == 'name'
        sort_sql = 'lower(description)' if @sort == 'description'
        sort_sql = 'necessities_count' if @sort == 'usages'

        sort_sql += ' asc' if @dir == 'asc'
        sort_sql += ' desc' if @dir == 'dsc'

        @page = params[:page] ? (params[:page].to_i - 1) : 0
        @total = Ingredient.all.size
        @ingredients = Ingredient.order(sort_sql).offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
      }
    end    
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      flash[:success] = "Ingredient saved"
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(ingredient_params)
      flash[:info] = "Ingredient updated"
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    ingredient = Ingredient.find(params[:id])

    if ingredient.necessities.size == 0
      ingredient.destroy
      flash[:info] = "Ingredient '#{ingredient.name}' removed"
    else
      flash[:danger] = "Ingredient can't be removed while having usages"
    end

    redirect_to :back
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end

end