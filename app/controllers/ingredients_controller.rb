class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order(:name).where("name like ?", "%#{params[:term]}%")

    respond_to do |format|
      format.js { render json: @ingredients.map(&:name) }
      format.html { render text: 'Nothing here' }
    end
    
  end

end