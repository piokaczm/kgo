class SearchesController < ApplicationController
  def search
    if params[:query].nil?
      @adverts = []
    else
      @adverts = Advert.search(params[:query]).records
      @zapytanie = params[:query]
    end
  end
end
