# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    res = SearchData::SearchByQuery.new(
      query: search_query[:query],
      search_data: ReadData::SearchedData.call
    ).call
    respond_to do |format|
      format.json { render json: res }
    end
  end

  private

  def search_query
    params.require(:search).permit(:query)
  end
end
