class UsersController < ApplicationController
   def user_params
    params.require(:user).permit(:user_id, :email)
  end
   
   def index
   end
   
   def show
   end
   
   def new
    #@user = User.new
   end
   
   def create
    @user = User.new(user_params)
   
    if(User.exists?(:user_id=>@user.user_id))
     flash[:notice] = "Sorry, this user-id is taken. Try again."
     
    else
     if @user.save
      flash[:notice] = "#{@user.user_id} was successfully created."
      redirect_to new_user_path
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
