class UsersController < ApplicationController

# before_filter :authorize

  def new

    @user = User.new

  end

  def create

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


  def fb_login

  end

  def edit

    @user = current_user

  end

  def update

    @user = current_user
    User.update(@user.id, full_name: edit_params[:full_name], profile_description: edit_params[:profile_description], display_picture: edit_params[:display_picture])
    @user.display_picture = edit_params[:display_picture]

      if @user.save
        flash[:success] = "Changes saved successfully."
        redirect_to root_path
      else
        flash[:error] = "Changes could not be captured."
        redirect_to root_path
      end

  end

  def search
    byebug
    @users = User.search(search_params[:search])

    # .order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # respond_to do |format|
    #  format.js  { render :partial => "elements/livesearch", :locals => {:search => @users, :query => params[:search]} }
    #  format.html    { render :root }
    # end
    respond_to do |format|
      format.js
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
