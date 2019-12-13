class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def send_message
    ContactsMailer.feedback_form(email: current_user.email, body: params[:body], admin_email: admin_email).deliver_now
    redirect_to root_path, { notice: t('.success')}
  end

  private
  
  def admin_email
    Admin.first.email
  end

end
