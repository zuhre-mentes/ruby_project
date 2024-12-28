class SessionsController < ApplicationController
  def new
    
  end

  def create
    
    user = User.find_by(email: params[:email])

    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Email or password is incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] = "Checked out."
    redirect_to root_path
  end
end
