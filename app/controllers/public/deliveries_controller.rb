class Public::DeliveriesController < ApplicationController
  
  def new
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end
  
  def create
    @delivery = Delivery.new(deliverie_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to '/deliveries'
  end
  
  def show
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to delivery_path(delivery.id)
  end

  def index
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end
  
  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to '/deliveries'
  end
  
  private
  
  def deliverie_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end
  
end
