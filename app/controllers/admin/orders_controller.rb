class Admin::OrdersController < ApplicationController
  def show

    @orders = Order.new
   # @order = Order.find(params[:id])
    @order = Order.find_by(id: params[:id])
    @order_items = @order.order_details
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
