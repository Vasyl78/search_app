# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    op = run Search::DataByQuery, params: search_params
    respond_to do |format|
      format.json { render json: op[:response] }
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
