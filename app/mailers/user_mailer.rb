class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Thanks for placing your order! It is order number")
  end
end
