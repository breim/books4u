class SearchesController < ApplicationController
  before_action :set_search, only: [:link]

  respond_to :html

  def autocomplete
    render json: Search.search(params[:query], autocomplete: true, limit: 10, fields: [:name, :id]).map{|search| search.slice(:name, :id) }
  end

  def link
    case @search.search_model
      when "User"
        redirect_to user_path(@search.search_id)
      when "Company"
        redirect_to company_path(@search.search_id)
      else
        root_path
    end
  end

  def search
    @search = Search.search(params[:q], limit: 30,fields: [:name])
  end


  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:name, :search_id, :search_model)
    end
end
