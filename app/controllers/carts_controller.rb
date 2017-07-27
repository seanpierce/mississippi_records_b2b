class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items.order(:created_at)
  end

  def add_one
    @item = OrderItem.find(params[:item])
    @item.quantity += 1
    @item.save
    respond_to do |format|
      format.js
    end
  end

  def remove_one
    @item = OrderItem.find(params[:item])
    if @item.quantity > 1
      @item.quantity -= 1
      @item.save
      respond_to do |format|
        format.js
      end
    end
  end

  def checkout
    @order = Order.find(current_order.id)
    @order.status = "completed"
    @order.save
    session[:order_id] = nil
    current_order

    flash[:notice] = "Thanks for placing your order. We'll be in touch."
    redirect_to catalog_path
  end

end
