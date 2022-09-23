class Public::ItemsController < ApplicationController
  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    @items = Item.all
    # @item_images = ItemImage.page(paramms[:page])
  end
  
  private
  def list_params
    params.require(:item).permit(:image)  
  end
  
end
