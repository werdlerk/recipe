class UnitsController < ApplicationController

  PAGE_SIZE = 10

  def index
    respond_to do |format| 
      format.js { render json: @units.map(&:name) }
      format.html {
        @sort = params[:sort] ? params[:sort] : 'name'
        @dir = params[:dir] ? params[:dir] : 'asc'

        sort_sql = 'id' if @sort == 'id'
        sort_sql = 'lower(name)' if @sort == 'name'
        sort_sql = 'necessities_count' if @sort == 'usages'

        sort_sql += ' asc' if @dir == 'asc'
        sort_sql += ' desc' if @dir == 'dsc'

        @page = params[:page] ? (params[:page].to_i - 1) : 0
        @total = Unit.all.size
        @units = Unit.order(sort_sql).offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
      }
    end
    
  end

end