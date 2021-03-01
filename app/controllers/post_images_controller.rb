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
    @post_images = PostImage.all
    # PostImageモデルの中にある全ての情報(全ての情報なので複数形)
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    # PostImageモデルの中からparamus[:id]を見つける
  end
  
  def destroy
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end