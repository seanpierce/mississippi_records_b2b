class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order.user_id = current_user.id
    @order.total_price = current_order.calculate_total
    @order.status = "in_progress"
    @item = @order.order_items.new(item_params)
    if @order.save!
      session[:order_id] = @order.id
      flash[:notice] = "#{@item.quantity} copies of #{@item.album.artist} - #{@item.album.title} added to cart."
    else
      flash[:alert] = "Something went wrong. Please try again!"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

private

  def item_params
    params.require(:order_item).permit(:quantity, :album_id)
  end
end
