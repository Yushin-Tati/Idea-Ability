class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.new(plan_params)
    plan.user_id = current_user.id
    if plan.save
      redirect_to plan_path(plan)
    else
      flash[:danger] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.update(plan_params)
      redirect_to my_plan_path(plan.user_id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to my_plan_path(plan.user_id)
  end

  private
  def plan_params
    params.require(:plan).permit(:user_id, :title, :image_id, :text, :status,)
  end



end
