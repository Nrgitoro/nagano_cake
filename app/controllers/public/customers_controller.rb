class Public::CustomersController < ApplicationController
  
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def list_params
    params.require(:customer).permit(:name_first, :name_second, :name_first_rubi, :name_second_rubi, :address, :email)
  end
  
end
