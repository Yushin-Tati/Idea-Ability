class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def set_search
    @q = User.ransack(params[:q])
    @q_users = @q.result(distinct: true).page(params[:page])
  end

  def plan_params
    params.require(:user).permit(:is_active)
  end
end
