module IngredientsHelper

  def allowed_params
    params.slice(:page, :sort, :dir)
  end

end