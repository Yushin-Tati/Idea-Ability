class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @target_id = params[:target_id]
    @target_type = params[:target_type]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      if @comment.target_type == "Plan"
        redirect_to plan_path(@comment.target_id)
      elsif @comment.target_type == "Ability"
        redirect_to ability_path(@comment.target_id)
      elsif @comment.target_type == "Product"
        redirect_to product_path(@comment.target_id)
      end
    else
      flash[:alert] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "変更内容を保存しました。"
      if @comment.target_type == "Plan"
        redirect_to plan_path(@comment.target_id)
      elsif @comment.target_type == "Ability"
        redirect_to ability_path(@comment.target_id)
      elsif @comment.target_type == "Product"
        redirect_to product_path(@comment.target_id)
      end
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "削除しました。"
    if params[:t] == "Plan"
      redirect_to plan_path(params[:i])
    elsif params[:t] == "Ability"
      redirect_to ability_path(params[:i])
    elsif params[:t] == "Product"
      redirect_to product_path(params[:i])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :target_id, :target_type, :text)
  end
end
