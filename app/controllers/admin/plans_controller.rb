class Admin::PlansController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.is_active == false
      @plan.is_active = true
    else
      @plan.is_active = false
    end
    @plan.update(plan_params)
    flash[:notice] = "ステータスを更新しました。"
    redirect_to admin_plan_path(@plan.id)
  end
  
  private
  
  def set_search
    @q = Plan.ransack(params[:q])
    @q_plans = @q.result(distinct: true).page(params[:page])
  end
  
  def plan_params
    params.permit(:is_active)
  end
end
