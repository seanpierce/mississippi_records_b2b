class AlbumsController < ApplicationController

  before_action :protect_catalog!, only: [:index]

  # catalog page
  def index
    @albums = Album.all.order(:artist)
    @order_item = current_order.order_items.new
  end

  # item detail page
  def show
    @album = Album.find(params[:id])
  end

end
