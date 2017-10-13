class UsersController < ApplicationController

  def new



  end

  def create

    user = User.new(user_params)

      if user.save

        session[:user_id] = user.id
        flash[:success] = "Your account has been successfully created!"
        redirect_to '/'

      else

        flash[:error] = "An error occurred, please try again"
        redirect_to new_user_path
      end

  end

  private

  def user_params

    params.require(:user).permit(:full_name, :username, :email_address,:password,:password_confirmation)

  end

end
