class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def show
  end

  def index
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items
    @total = 0
    if params[:order][:select_address] == "me"
       @order.postal_code = current_customer.post_code
       @order.address = current_customer.address
       @order.name = current_customer.name_first
    elsif params[:order][:select_address] == "already"
          @address = Delivery.find(params[:order][:delivery_id])
          @order.postal_code = @address.postal_code
          @order.address = @address.address
          @order.name = @address.name
    else
    end

  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end