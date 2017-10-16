class PhotosController < ApplicationController

  before_action :authorize


  def index

    @user = current_user

  end

  def new

    @photo = Photo.new

  end

  def create
byebug
    @photo = Photo.new(user_id: current_user.id, image: photo_params[:image], caption: photo_params[:caption])
      if @photo.save
        flash[:success] = "Photo saved successfully!"
        redirect_to root_path
      else
        flash[:error] = "Photo could not be saved, please try again."
        redirect_to new_user_photo_path(current_user.id)
      end
  end

private

  def photo_params

    params.require(:photo).permit(:image, :caption)

  end
end
