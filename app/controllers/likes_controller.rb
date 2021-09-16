class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.new
    @like.favorite_id = params[:favorite_id]
    @like.favorite_type = params[:favorite_type]
    @like.save
    if @like.favorite_type == "Plan"
      redirect_to plan_path(params[:favorite_id])
    elsif @like.favorite_type == "Ability"
      redirect_to ability_path(params[:favorite_id])
    elsif @like.favorite_type == "Product"
      redirect_to product_path(params[:favorite_id])
    end
  end

  def destroy
    like = current_user.likes.find_by(favorite_id: params[:favorite_id], favorite_type: params[:favorite_type])
    like.destroy
    if params[:favorite_type] == "Plan"
      redirect_to plan_path(params[:favorite_id])
    elsif params[:favorite_type] == "Ability"
      redirect_to ability_path(params[:favorite_id])
    elsif params[:favorite_type] == "Product"
      redirect_to product_path(params[:favorite_id])
    end
  end
end
