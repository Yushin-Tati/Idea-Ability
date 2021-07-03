class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @pruduct.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product)
    else
      flash[:danger] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to my_product_path(@product.user_id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to my_product_path(product.user_id)
  end

  private
  def product_params
    params.require(:product).permit(:user_id, :title, :image, :text, :status)
  end
  
end
