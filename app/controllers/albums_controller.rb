class AlbumsController < ApplicationController

  before_action :protect_catalog!, only: [:index]

  # catalog page
  def index
    @albums = Album.all.order(:artist)
  end

  # item detail page
  def show
    @album = Album.find(params[:id])
  end

end
