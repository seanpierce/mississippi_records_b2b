class AlbumsController < ApplicationController

  before_action :protect_catalog!, only: [:index]

  # catalog page
  def index
    if params[:category]
      @albums = Album.category(params[:category]).order(:artist)
    else
      @albums = Album.all.order(:artist)
    end
    @order_item = current_order.order_items.new
  end

  # item detail page
  def show
    @album = Album.find(params[:id])
  end

end
