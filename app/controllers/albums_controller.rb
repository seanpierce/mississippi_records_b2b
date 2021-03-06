class AlbumsController < ApplicationController

  before_action :protect_catalog!

  # catalog page
  def index
    if params[:query]
      @albums = Album.search(params[:query])
      @category_title = "Search results for \"#{params[:query]}\""
    elsif params[:category]
      @albums = Album.category(params[:category]).order(:artist).page params[:page]
      @category_title = Album.category_title(params[:category])
    else
      @albums = Album.all.order(:artist).page params[:page]
      @category_title = "Full Catalog"
    end
    @order_item = current_order.order_items.new
  end

  # item detail page
  def show
    @album = Album.find(params[:id])
    @order_item = current_order.order_items.new
    @more_from = Album.more_from(@album.artist, @album.title)
  end

end
