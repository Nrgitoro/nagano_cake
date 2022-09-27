class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.new
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    if order.update!(order_params)
       order.order_details.update_all(manufacture_status: 1) if order.order_status == "wait_payment"
       order.update_all(order_status: 2) if order.order_details.manufacture_status == "manufacturing"
       order.update_all(order_status: 3) if order.order_details.manufacture_status == "finish"
       redirect_back(fallback_location: root_path)
    end
  end
end
