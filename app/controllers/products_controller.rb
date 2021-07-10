class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      flash[:notice] = "アビリティを投稿しました。"
      redirect_to product_path(@product)
    else
      flash[:alert] = "入力内容に不備があります。入力内容を再度ご確認ください。"
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
      flash[:notice] = "変更内容を保存しました。"
      redirect_to my_product_path(@product.user_id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice] = "削除しました。"
    redirect_to my_product_path(product.user_id)
  end

  private

  def product_params
    params.require(:product).permit(:user_id, :title, :image, :text, :status)
  end
end
