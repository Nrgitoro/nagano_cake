class Admin::OrderDetailsController < ApplicationController

  def update
    @order_item = OrderDetail.find(params[:id])
    #　更新をかけたいパスの引数
    @order = @order_item.order
    @order_item.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
