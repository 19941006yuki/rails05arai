class CommentsController < ApplicationController
  def index
  #  p params
     @comment_topics = current_user.comment_topics
  end
  
  def new
    if logged_in?
      @comment = Comment.new
      @comment.topic_id=params[:topic_id]
      @comment.user_id=current_user.id
    else
      redirect_to comments_path
    end
  end  
  def create
    @comment = current_user.comments.new(comment_params)
      #コメントしたトピックIDをコメントと結びつけしている。
      #なぜ
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      redirect_to topics_path, denger: "コメントに失敗しました"  
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :description)
  end
end