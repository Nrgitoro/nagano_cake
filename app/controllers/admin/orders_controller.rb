class Admin::OrdersController < ApplicationController
  def show

    @orders = Order.new
   # @order = Order.find(params[:id])
    @order = Order.find_by(id: params[:id])

    @order_items = @order.order_details
  end

    @order = Order.find_by(id: params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
