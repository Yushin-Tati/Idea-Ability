class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.is_active == false
      @product.is_active = true
    else
      @product.is_active = false
    end
    @product.update(product_params)
    flash[:notice] = "ステータスを更新しました。"
    redirect_to admin_product_path(@product.id)
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
