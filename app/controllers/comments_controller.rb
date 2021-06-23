class CommentsController < ApplicationController
   #before_action :autheniticate_user
   
  def index
    @comments = Comment.where(:target_id == params[:target_id] && :target_type == params[:target_type])
    if params[:target_type] == "Plan"
      @commented = Plan.find(params[:target_id])
    elsif params[:target_type] == "Ability"
      @commented = Ability.find(params[:target_id])
    elsif params[:target_type] == "Product"
      @commented = Product.find(params[:target_id])
    end
  end

  def new
    @comment = Comment.new
    @target_id = params[:target_id]
    @target_type = params[:target_type]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to comment_path(@comment)
    else
      flash[:danger] = "入力内容に不備があります。入力内容を再度ご確認ください。"
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      flash[:alert] = "更新に失敗しました。入力内容を再度ご確認ください"
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :target_id, :target_type, :parent_id, :text)
  end
end
