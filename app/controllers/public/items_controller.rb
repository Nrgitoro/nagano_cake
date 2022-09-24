class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @items = Item.new(list_params)
    @items.save
    redirect_to cart_items_path
  end


  def index
    @items = Item.all
    # @item_images = ItemImage.page(paramms[:page])
  end

  private
  def list_params
    params.require(:item).permit(:amount)
  end

end
