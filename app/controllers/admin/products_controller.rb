class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  
  def index
    @products = Product.all
  end

  def show
  end

  def update
  end
  
  private
  
  def set_search
    @q = Product.ransack(params[:q])
    @q_products = @q.result(distinct: true).page(params[:page])
  end
  
  def product_params
    params.permit(:is_active)
  end
end
