class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.all
    @customer =Customer.find(params[:id])
  end

  def edit
    @customers = Customer.all
    @customer =Customer.find(params[:id])
  end
end
