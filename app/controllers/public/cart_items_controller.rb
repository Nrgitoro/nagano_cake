class Public::CartItemsController < ApplicationController
  def index
    #現在のcustomerが選んだ商品
    @cart_item = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
       redirect_to cart_items_path
    elsif @cart_item.save
       redirect_to cart_items_path
    else
      render :'/items'
    end
  end

  def update
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end


  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end
private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
