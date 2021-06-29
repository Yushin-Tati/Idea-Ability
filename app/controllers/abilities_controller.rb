class AbilitiesController < ApplicationController
   
  def index
    @abilities = Ability.all
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(ability_params)
    @ability.user_id = current_user.id
    if @ability.save
      redirect_to ability_path(@ability)
    else
      flash[:danger] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(@ability)
      redirect_to my_ability_path(@ability.user_id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    ability = Ability.find(params[:id])
    ability.destroy
    redirect_to my_ability_path(ability.user_id)
  end

  private
  def plan_params
    params.require(:ability).permit(:user_id, :title, :image_id, :text, :status)
  end
end
