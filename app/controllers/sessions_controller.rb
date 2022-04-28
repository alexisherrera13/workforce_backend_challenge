class SessionsController < ApplicationController
  def create
    @user = User.find_by(email_address: params[:session][:email_address])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "logged in successfully"
      redirect_to organisations_path
    else
      flash.now[:alert] = "there was something wong with your credentials"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "you have been logged out"
    redirect_to root_path
  end
end
