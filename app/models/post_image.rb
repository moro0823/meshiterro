class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  #画像アップ用のメソッド。フィールド名（image）を指定 
end
