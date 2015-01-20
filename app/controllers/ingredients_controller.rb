class IngredientsController < ApplicationController

  PAGE_SIZE = 10

  def index
    respond_to do |format|
      format.js { 
        ingredients = Ingredient.order(:name).where("name like ?", "%#{params[:term]}%")
        render json: ingredients.map(&:name)
      }
      format.html {
        @sort = params[:sort] ? params[:sort] : 'name'
        @page = params[:page] ? (params[:page].to_i - 1) : 0
        @total = Ingredient.all.size
        @ingredients = Ingredient.order("lower(#{@sort})").offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
      }
    end    
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      flash[:notice] = "Ingredient saved"
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])

    if ingredient.update(ingredient_params)
      flash[:notice] = "Ingredient updated"
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    ingredient = Ingredient.find(params[:id]).destroy
    flash[:notice] = "Ingredient '#{ingredient.name}' removed"
    redirect_to :back
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end

end