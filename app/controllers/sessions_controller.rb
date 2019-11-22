class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      #если всё в порядке создаем пользовательскую сессию
      session[:user_id] = user.id
      if cookies[:original_url]
        redirect_to cookies[:original_url]
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def logout
    logged_out
  end

end
