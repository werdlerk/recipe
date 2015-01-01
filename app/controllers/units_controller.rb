class UnitsController < ApplicationController

  def index
    @units = Unit.order(:name).where("name like ?", "%#{params[:term]}%")

    respond_to do |format| 
      format.js { render json: @units.map(&:name) }
      format.html { render text: 'Nothing here' }
    end
    
  end

end