class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.is_active == false
      @user.is_active = true
    else
      @user.is_active = false
    end
    @user.update(user_params)
    flash[:notice] = "ステータスを更新しました。"
    redirect_to admin_user_path(@user.id)
  end
  
  private
  
  def set_search
    @q = User.ransack(params[:q])
    @q_users = @q.result(distinct: true).page(params[:page])
  end

  def user_params
    params.permit(:is_active)
  end
end
