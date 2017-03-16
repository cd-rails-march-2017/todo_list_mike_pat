class UsersController < ApplicationController
  def index
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      if params[:password] == user[:password]
        session[:user_id] = user.id
        session[:username] = user.username
        redirect_to "/"
      else
        flash[:error] = "Incorrect Password"
        redirect_to "/login"
      end
    else
      user = User.create(username: params[:username], password: params[:password])
      if user.errors.full_messages[0]
        flash[:error] = user.errors.full_messages
        redirect_to "/login"
      else
        session[:user_id] = user.id
        session[:username] = user.username
        redirect_to "/"
      end
    end
  end

end
