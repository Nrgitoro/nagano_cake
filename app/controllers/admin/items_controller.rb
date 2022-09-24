class Admin::ItemsController < ApplicationController
  def index

    @item = Item.find_by(id: params[:id])
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.present?
    @item.update(item_params)
    redirect_to admin_item_path

  end

  private

  def item_params
  params.require(:item).permit(:name, :introduction, :price, :item_image, :item_status)
  end
end