module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session.has_key? :user_id
  end

  def authorize
    redirect_to root_path unless current_user
  end

end
