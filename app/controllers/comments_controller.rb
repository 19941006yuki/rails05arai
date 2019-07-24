class CommentsController < ApplicationController
  def index
    
   @comment_topics = current_user.comment_topics
  end
  def new
    if logged_in?
      @comment = Comment.new
    else
      redirect_to comments_path
    end
  end  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id)
  end
end