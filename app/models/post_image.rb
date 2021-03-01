class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  #画像アップ用のメソッド。フィールド名（image）を指定
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
