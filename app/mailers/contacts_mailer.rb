class ContactsMailer < ApplicationMailer

  def feedback_form(params)
    @email = params[:email]
    @body = params[:body]

    mail to: 'testguru2020@gmail.com'
  end
end
