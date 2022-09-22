class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  private
  def customer_params
    params.require(:customer).permit(:name_first, :name_second, :name_first_rubi, :name_second_rubi, :address, :email)
  end
  
end
