class CookingRecipesController < ApplicationController

  def index
    @cooking_recipes = CookingRecipe.all
  end

end