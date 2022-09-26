class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    redirect_to customer_path
    else
    render :edit
    end
  end

  def confirm

  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name_first, :name_second, :name_firdt_rubi, :name_second_rubi, :address, :tel, :post_code, :email)
  end

end
