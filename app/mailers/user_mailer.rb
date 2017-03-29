class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Thanks for registering!")
  end

  def order_receipt_email(order)
    @order = order
    mail(to: params[:stripe_email], subject: "Jungle: Receipt for Order Number #{order.id}")
  end
end
