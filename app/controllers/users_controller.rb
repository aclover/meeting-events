class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
    @user = User.find(params[:id])

  end

  def register
    @user = User.new user_params
	   if @user.save
	   		session[:user_id] = @user.id
	   		redirect_to "/events"
	   else
	     flash[:error] = @user.errors.full_messages
	     redirect_to "/"
		end
  end

  def logout
    session[:user_id] = nil

		redirect_to "/"
  end

  def login
    user = User.find_by_email(params[:email])

	   if user && user.authenticate(params[:password])
			session[:user_id] = user.id
	        redirect_to "/events"
	   else
	     flash[:errors] = ["Invalid user name and password"]
	     redirect_to '/'
	   end

  end

  def update
    @user = User.update(params[:id], user_params)
    # render json: @user
    redirect_to '/events'
  end


  private
   	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :location, :state)
	end
end
