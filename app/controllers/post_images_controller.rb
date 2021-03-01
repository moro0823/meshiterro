class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    # PostImageモデルの中にある全ての情報(全ての情報なので複数形)
    # ペーシャの実装
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    # PostImageモデルの中からparams[:id]を見つける
    @post_comment = PostComment
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
