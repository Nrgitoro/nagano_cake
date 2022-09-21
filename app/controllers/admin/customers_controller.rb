class Admin::CustomersController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
  end

  def edit
  end
end
