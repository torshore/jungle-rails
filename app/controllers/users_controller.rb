class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
     respond_to do |format|
      if user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(user).deliver_later

        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render json: user, status: :created, location: xsuser }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
      puts "Email sent"
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation)
    end


end
