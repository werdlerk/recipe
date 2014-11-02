class CookingRecipesController < ApplicationController

  def index
    @cooking_recipes = CookingRecipe.all
  end

  def new
    @cooking_recipe = CookingRecipe.new
    5.times { @cooking_recipe.necessities.build }
  end

end