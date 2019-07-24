class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
#なぜ[]なのか。
    if favorite.save
#データベースへの保存の有無で処理を分ける
      redirect_to topics_path, success: 'お気に入りに登録しました'
# success = flash_type
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
end