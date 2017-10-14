class UsersController < ApplicationController

# before_filter :authorize

  def new

    @user = User.new

  end

  def create
byebug
    user = User.new(user_params)

      if user.save

        session[:user_id] = user.id
        flash[:success] = "Your account has been successfully created!"
        redirect_to "/users/edit/#{user.id}", method: :put

      else

        flash[:error] = "An error occurred, please try again"
        redirect_to new_user_path
      end

  end

  def edit
byebug
    @user = current_user

  end

  def update

    @user = current_user
    # @user.image = params[:user][:image]
    @user.profile_description = params[:user][:profile_description]
    @user.full_name = params[:user][:full_name]
      if @user.save
        flash[:success] = "Changes saved successfully."
        redirect_to root_path
      else
        flash[:error] = "Changes could not be captured."
        redirect_to root_path
      end

  end

  private

  def user_params

    params.require(:user).permit(:full_name, :username, :email_address,:password,:password_confirmation)

  end

end
