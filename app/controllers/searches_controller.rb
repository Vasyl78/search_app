# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    uri_link = 'https://gist.githubusercontent.com/g3d/8f524cb3252d9e026d3f33196c1b51dd/raw/ac40d1510efbe4674a69aff7e19b5d894826be38/data.json'
    uri = URI.parse uri_link
    res = Net::HTTP.get uri
    respond_to do |format|
      format.json { render json: JSON.parse(res) }
    end
  end
end
