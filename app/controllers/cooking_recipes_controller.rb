class CookingRecipesController < ApplicationController

  def index
    @cooking_recipes = CookingRecipe.all
  end

  def new
    @cooking_recipe = CookingRecipe.new
  end

  def create
    @cooking_recipe = CookingRecipe.new(cooking_recipe_params)

    if params[:images] && params[:images][0].present?
      params[:images].each do |file|
        @cooking_recipe.images.build(file: file)
      end
    end

    if @cooking_recipe.save
      flash[:notice] = 'Recipe saved'
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
      flash[:notice] = 'Recipe updated'
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
    flash[:notice] = 'Recipe removed'
    redirect_to cooking_recipes_path
  end

  def add_necessity_fields
  end

  def add_direction_fields
  end

  private

  def cooking_recipe_params
    params.require(:cooking_recipe).permit(
      :name, :description, 
      necessities_attributes: [:id, :amount, :unit_id, :ingredient_id, :_destroy],
      directions_attributes: [:id, :sort_order, :description, :_destroy],
      images_attributes: [:id, :file, :_destroy]
    )
  end

end