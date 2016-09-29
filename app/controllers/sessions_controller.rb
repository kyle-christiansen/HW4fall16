class SessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
  
  def new
    
  end

  def create
    if(User.exists? user_id: session_params['user_id'])
      user = User.find_by_user_id(session_params['user_id'])
      if(user.email == session_params['email'])
       flash[:flash_message] =  "#{user.user_id} successfully logged in"
       session[:session_token] = user.session_token
       redirect_to movies_path
      else
        flash[:notice] =  "Invalid Login credentials"
        @current_user = nil
        redirect_to login_path
      end
    else
      flash[:notice] =  "Invalid Login credentials"
        @current_user = nil
        redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to movies_path
  end
end
