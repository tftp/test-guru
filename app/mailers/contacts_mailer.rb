class ContactsMailer < ApplicationMailer

  def feedback_form(params)
    @email = params[:email]
    @body = params[:body]

    mail to: params[:admin_email]
  end
end
