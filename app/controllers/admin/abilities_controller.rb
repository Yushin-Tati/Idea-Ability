class Admin::AbilitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search
  
  def index
    @abilities = Ability.all
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.is_active == false
      @ability.is_active = true
    else
      @ability.is_active = false
    end
    @ability.update(ability_params)
    flash[:notice] = "ステータスを更新しました。"
    redirect_to admin_ability_path(@ability.id)
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
