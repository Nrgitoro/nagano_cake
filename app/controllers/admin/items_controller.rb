class Admin::ItemsController < ApplicationController
  def index
    @items =Item.all
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

  end

  private

  def item_params
  params.require(:item).permit(:name, :introduction, :price, :item_image)
  end
end