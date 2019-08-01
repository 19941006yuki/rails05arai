class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users, :comment_users)
    #all.includesとは
    #N+１問題を回避するために用いられる
    #form_forの引数にする
    #@comment = Comment.new
    #なぜ
  end
    
  def new
    if logged_in?
      @topic = Topic.new
    else
      redirect_to topics_path
    end
  end
  
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image,:description)
  end
  #Private以下のメソッドはprivateなメソッドとなり、
  #他のクラスからレシーバ付きで呼び出すことができない。
  #つまり、クラスの中でしか呼び出すことができない。 
  
end