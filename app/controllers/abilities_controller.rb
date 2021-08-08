class AbilitiesController < ApplicationController
  before_action :set_search
  
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
      flash[:notice] = "アビリティを投稿しました。"
      redirect_to ability_path(@ability)
    else
      flash[:alert] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def show
    @ability = Ability.find(params[:id])
    @comments = Comment.where((:target_type == "Ability") && (:target_id == params[:id])).order(created_at: "DESC")
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      flash[:notice] = "変更内容を保存しました。"
      redirect_to my_ability_path(@ability.user_id)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    ability = Ability.find(params[:id])
    ability.destroy
    flash[:notice] = "削除しました。"
    redirect_to my_ability_path(ability.user_id)
  end

  private
  
  def set_search
    @q = Ability.ransack(params[:q])
    @q_abilities = @q.result(distinct: true).page(params[:page])
  end

  def ability_params
    params.require(:ability).permit(:user_id, :title, :image, :text, :status)
  end
end
