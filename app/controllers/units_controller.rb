class UnitsController < ApplicationController
  before_action :require_logged_in

  PAGE_SIZE = 10

  def index
    respond_to do |format| 
      format.js { 
        units = Unit.where(:locale => I18n.locale).where("name like ?", "%#{params[:term]}%").order(:name)
        render json: units.map(&:name)
      }
      format.html {
        @sort = params[:sort] ? params[:sort] : 'name'
        @dir = params[:dir] ? params[:dir] : 'asc'

        sort_sql = 'id' if @sort == 'id'
        sort_sql = 'lower(name)' if @sort == 'name'
        sort_sql = 'necessities_count' if @sort == 'usages'

        sort_sql += ' asc' if @dir == 'asc'
        sort_sql += ' desc' if @dir == 'dsc'

        @page = params[:page] ? (params[:page].to_i - 1) : 0
        @total = Unit.where(:locale => I18n.locale).size
        @units = Unit.where(:locale => I18n.locale).order(sort_sql).offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
      }
    end
    
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      flash[:success] = t('units.flash.unit_saved')
      redirect_to units_path
    else
      render :new
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update(unit_params)
      flash[:info] = t('units.flash.unit_updated')
      redirect_to units_path
    else
      render :edit
    end
  end

  def destroy
    unit = Unit.find(params[:id])

    if unit.necessities.size == 0
      unit.destroy
      flash[:info] = t('units.flash.unit_removed', name:unit.name)
    else
      flash[:danger] = t('units.flash.unable_to_remove')
    end

    redirect_to :back
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :locale)
  end

end