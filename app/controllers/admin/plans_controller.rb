class Admin::PlansController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  
  def index
    @plans = Plan.all
  end

  def show
  end

  def update
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
