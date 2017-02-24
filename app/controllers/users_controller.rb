class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def register
    new_user = User.new(user_params)
    if new_user.valid?
      new_user.save
      session[:user_id] = new_user.id
      redirect_to '/songs'
    else
      flash[:errors] = new_user.errors.full_messages
      redirect_to '/main'
    end
  end

  def login
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id]= user.id
      redirect_to '/songs'
    else
      flash[:errors] = ["Invalid Combination, try again.  Or you might need sign up"]
      redirect_to '/main'
    end
  end

  def logout
    session[:user_id]=nil
    redirect_to '/main'
  end


  private
		def user_params
			params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
		end
end
