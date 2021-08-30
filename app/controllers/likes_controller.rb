class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.new
    @like.favorite_id = params[:favorite_id]
    @like.favorite_type = params[:favorite_type]
    @like.save
    if @like.favorite_type == "Plan"
      redirect_to plans_path
    elsif @like.favorite_type == "Ability"
      redirect_to abilities_path
    elsif @like.favorite_type == "Product"
      redirect_to products_path
    end
  end
  
  def destroy
    like = current_user.likes.find_by(favorite_id: params[:favorite_id], favorite_type: params[:favorite_type])
    like.destroy
    if params[:favorite_type] == "Plan"
      redirect_to plans_path
    elsif params[:favorite_type] == "Ability"
      redirect_to abilities_path
    elsif params[:favorite_type] == "Product"
      redirect_to products_path
    end
  end
  
end
