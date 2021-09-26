class Admin::AbilitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  
  def index
    @abilities = Ability.all
  end

  def show
  end

  def update
  end
  
  private
  
  def set_search
    @q = Ability.ransack(params[:q])
    @q_abilities = @q.result(distinct: true).page(params[:page])
  end
  
  def ability_params
    params.permit(:is_active)
  end
end
