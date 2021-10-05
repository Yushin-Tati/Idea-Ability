class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.is_active == false
      @comment.is_active = true
    else
      @comment.is_active = false
    end
    @comment.update(comment_params)
    flash[:notice] = "ステータスを更新しました。"
    redirect_to admin_comment_path(@comment.id)
  end

  private

  def set_search
    @q = Comment.ransack(params[:q])
    @q_comments = @q.result(distinct: true).page(params[:page])
  end

  def comment_params
    params.permit(:is_active)
  end
end
