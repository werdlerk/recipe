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
        @ingredients = Ingredient.order(@sort.to_sym).offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
      }
    end    
  end

end