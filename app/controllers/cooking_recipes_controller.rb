class CookingRecipesController < ApplicationController
  before_action :access_by_author, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:new] 

  def index
    @cooking_recipes = CookingRecipe.all
  end

  def new
    @cooking_recipe = CookingRecipe.new
  end

  def create
    @cooking_recipe = CookingRecipe.new(cooking_recipe_params)
    @cooking_recipe.user = current_user

    if params[:images] && params[:images][0].present?
      params[:images].each do |file|
        @cooking_recipe.images.build(file: file)
      end
    end

    if @cooking_recipe.save
      flash[:success] = 'Recipe saved'
      redirect_to cooking_recipes_path
    else
      render :new
    end
  end

  def edit
    @cooking_recipe = CookingRecipe.find(params[:id])
  end

  def update
    @cooking_recipe = CookingRecipe.find(params[:id])

    if params[:images] && params[:images][0].present?
      params[:images].each do |file|
        @cooking_recipe.images.build(file: file)
      end
    end
    
    if @cooking_recipe.update(cooking_recipe_params)
      flash[:success] = 'Recipe updated'
      redirect_to cooking_recipes_path
    else
      render :edit
    end
  end

  def show
    @cooking_recipe = CookingRecipe.find(params[:id])
  end

  def destroy
    @cooking_recipe = CookingRecipe.find(params[:id])
    @cooking_recipe.destroy
    flash[:success] = 'Recipe removed'
    redirect_to cooking_recipes_path
  end

  def add_necessity_fields
  end

  def add_direction_fields
  end

  private

  def cooking_recipe_params
    params.require(:cooking_recipe).permit(
      :name, :description, :servings, :duration_mins,
      necessities_attributes: [:id, :amount, :unit_name, :ingredient_name, :_destroy],
      directions_attributes: [:id, :sort_order, :description, :_destroy],
      images_attributes: [:id, :file, :_destroy]
    )
  end

  def access_by_author
    access_denied unless user_logged_in? and CookingRecipe.find(params[:id]).user == current_user
  end

  def require_user
    unless user_logged_in?
      flash[:warning] = "You need to be logged in to create a new recipe. Please log in or <a href='#{ register_path }'>register</a> for an account."
      redirect_to root_path
    end
  end

end