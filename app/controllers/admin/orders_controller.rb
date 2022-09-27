class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    @order_items = @order.order_details



  end
end
