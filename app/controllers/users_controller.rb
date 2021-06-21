class UsersController < ApplicationController
   before_action :autheniticate_user
   
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def my_plan
    @user = User.find(params[:id])
  end
  
  def my_ability
    @user = User.find(params[:id])
  end
  
  def my_product
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image_id, :telephone_number, :status,)
  end

end
