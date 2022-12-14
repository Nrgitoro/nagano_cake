class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer =Customer.find(params[:id])
  end

  def edit
    @customer =Customer.find(params[:id])
  end

   def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to admin_customer_path
    else
    render :edit
    end
   end

    private

  def customer_params
    params.require(:customer).permit(:name_first, :name_second, :name_firdt_rubi, :name_second_rubi, :address, :tel, :post_code, :email, :is_deleted)
  end

end
