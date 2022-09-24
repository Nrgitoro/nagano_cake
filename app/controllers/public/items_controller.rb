class Public::ItemsController < ApplicationController
  def show
    @items =Item.new
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    # @item_images = ItemImage.page(paramms[:page])
  end

  private
  def list_params
    params.require(:item).permit(:image, :amount)
  end

end
