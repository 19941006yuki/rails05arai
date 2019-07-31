class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    #viewから値を取ってきている
    #@user = Topic.find_by(id: params[:topic_id])
    #@favorites_count = Favorite.where(user_id: @user.id).count
    if favorite.save
#データベースへの保存の有無で処理を分ける
      redirect_to topics_path, success: 'お気に入りに登録しました'
# success = flash_type
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(params[:topic_id])
    favorite.destroy
    redirect_to topics_path, success: 'いいねを削除しました'  
  end  
end