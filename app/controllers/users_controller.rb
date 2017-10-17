class UsersController < ApplicationController

# before_filter :authorize

  def new

    @user = User.new

  end

  def create

    user = User.new(user_params)

      if user.save
        session[:user_id] = user.id
        flash[:success] = "Your account has been successfully created, complete your profile."
        redirect_to edit_profile_path(user.id)
      else
        flash[:error] = "An error occurred, please try again"
        redirect_to new_user_path
      end

  end


  def fb_login

  end

  def set_username
    @user = current_user
      User.update(@user.id, username: params[:user][:username])
      if @user.save
        redirect_to edit_profile_path(@user.id)
      else
        redirect_to fb_login_path(@user.id)
      end
  end

  def edit

    @user = current_user

  end

  def update

    @user = current_user
    User.update(@user.id, full_name: edit_params[:full_name], profile_description: edit_params[:profile_description], display_picture: edit_params[:display_picture])
    @user.display_picture = edit_params[:display_picture]

      if @user.save
        flash[:success] = "Profile completed, please verify your account."
        redirect_to new_verification_path(@user.id)
      else
        flash[:error] = "Changes could not be captured, try again another time. Please proceed to verify your account."
        redirect_to new_verification_path(@user.id)
      end

  end

  def search

    @users = User.search(search_params[:search])

    respond_to do |format|
      format.js
      # if browser does not support .js, the line below provides a html fallback
      # format.html { redirect t}
    end
  end

  private

  def user_params

    params.require(:user).permit(:full_name, :username, :email_address,:password,:password_confirmation)

  end

  def edit_params

    params.require(:user).permit(:full_name, :display_picture, :profile_description)

  end

  def search_params

    params.slice(:search)

  end

end
