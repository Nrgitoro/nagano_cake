class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

private

  def cart_item_params
    params.require(:cart_item)
  end

end
