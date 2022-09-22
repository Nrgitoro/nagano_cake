class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name_first, :name_second, :name_firdt_rubi, :name_second_rubi, :address, :tel, :post_code, :email)
  end

end
