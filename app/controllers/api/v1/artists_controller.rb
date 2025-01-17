class Api::V1::ArtistsController < ApplicationController
  def index
    artists = Artist.all.sort_by{ |artist| artist.popularity }
    
    unless artists.empty?
      artists_data = artists.reverse.map { |artist| artist.create_body }

      render json: {data: artists_data}.to_json, status: 200
    else
      render status: 204
    end
  end
end
