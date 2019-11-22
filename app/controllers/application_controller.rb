class ApplicationController < ActionController::Base

#  protect_from_forgery with: :exeption

  helper_method :current_user,
                :logged_in?

  private
  def authenticate_user!
    unless current_user
      cookies[:original_url] = request.original_url
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def logged_out
    session[:user_id] = nil
    cookies[:original_url] = nil
    redirect_to login_path
  end

end
