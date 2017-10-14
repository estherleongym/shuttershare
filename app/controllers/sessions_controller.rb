class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by_email_address(params[:user][:email_address])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Hi, #{user.username}"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy

    session[:user_id] = nil
    redirect_to root_path

  end



end
