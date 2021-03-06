class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/', notice: 'Account created!'
    else

      redirect_to '/login', notice: 'Something went wrong, please try again!'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end
