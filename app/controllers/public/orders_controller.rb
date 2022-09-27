class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @order = Order.all
    @order_detail = OrderDetail.all
  end

  def confirm
    @order = Order.new(order_params)
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

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        order_detail.save
      end
      redirect_to orders_about_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end

  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:billing, :payment_method, :postal_code, :address, :name)
  end

end