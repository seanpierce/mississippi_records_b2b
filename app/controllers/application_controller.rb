class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def after_sign_in_path_for(resource)
    catalog_path
  end

  def protect_catalog!
    if !current_user
      flash[:alert] = "Please log in to access the catalog"
      redirect_back(fallback_location: new_user_session_path)
    end
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      current_user.orders.new
    end
  end
end
