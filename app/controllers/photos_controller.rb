class PhotosController < ApplicationController

  before_action :authorize


  def index

    @user = current_user

  end

  def new

    @photo = Photo.new

  end

  def create

    @photo = Photo.new(user_id: current_user.id, photo: photo_params[:photo], caption: photo_params[:caption])
      if @photo.save
        flash[:success] = "Photo saved successfully!"
        redirect_to root_path
      else
        flash[:error] = "Photo could not be saved, please try again."
        redirect_to new_user_photo_path(current_user.id)
      end
  end

  def edit

    @user_id = params[:user_id]
    @photo_id = params[:id]
    @photo = Photo.find(@photo_id)

  end

  def update

    @photo_id = params[:id]
    @photo = Photo.find(@photo_id)
    Photo.update(@photo_id, caption: edit_photo_params[:caption])

      if @photo.save
        flash[:success] = "Changes saved successfully."
        redirect_to root_path
      else
        flash[:error] = "Changes could not be captured."
        redirect_to root_path
      end

  end

  def destroy

    @photo_id = params[:id]
    Photo.delete(@photo_id)
    redirect_to root_path

  end

private

  def photo_params

    params.require(:photo).permit(:photo, :caption)

  end

  def edit_photo_params

    params.require(:photo).permit(:caption)

  end
end
