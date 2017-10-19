class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by_email_address(params[:user][:email_address])

    if user
      byebug
      # && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Hi, #{user.username}"
      redirect_to root_path

    else
      redirect_to root_path
    end
  end

  def create_from_omniauth

    auth_hash = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

        # if: previously already logged in with OAuth
        if authentication.user
          user = authentication.user
          authentication.update_token(auth_hash)
          session[:user_id] = user.id
          flash[:success] = "Signed in!"
            redirect_to root_path

        # else: user logs in with OAuth for the first time
        else
          user = User.create_with_auth_and_hash(authentication, auth_hash)
          session[:user_id] = user.id
          # you are expected to have a path that leads to a page for editing user details
          flash[:success] = "User created. Please set username"
           redirect_to fb_login_path(user.id)

        end

        # sign_in(user)
        # redirect_to root_path
  end

  def destroy

    session[:user_id] = nil
    redirect_to root_path

  end



end
