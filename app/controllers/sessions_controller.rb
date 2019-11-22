class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      #если всё в порядке создаем пользовательскую сессию
      session[:user_id] = user.id
      redirect_to cookies[:original_url] || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def logout
    logged_out
  end

end
