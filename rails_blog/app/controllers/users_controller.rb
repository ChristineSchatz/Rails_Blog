class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])

    if params[:id].to_i == session[:user_id]
      render :file => 'app/views/users/show.erb'
    else
      permission_denied
    end

  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
