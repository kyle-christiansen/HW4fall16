class UsersController < ApplicationController
 
   def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
   end
   
   def index
   end
   
   def show
   end
   
   def new
    @user = User.new
   end
   
   def create
    @user = User.new(user_params)
   
    if User.exists?(:user_id => @user.user_id)
     flash[:notice] = "Sorry, the user-id \"#{@user.user_id}\" is already taken. Try again."
      redirect_to new_user_path
    else
     if User::create_user!(user_params)
      flash[:notice] = "Welcome #{@user.user_id} your account was successfully created."
      redirect_to login_path
     end
    end 
   end
   
   def edit
   end
   
   def update
   end
   
   def delete
   end
end
