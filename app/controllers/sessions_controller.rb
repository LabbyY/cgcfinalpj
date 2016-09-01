class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login_as user
      redirect_to artists_path
    else
      render :new
    end
  end

    def login_as(user)
      session[:user_id] = user.id
      @current_user = user
    end

end
