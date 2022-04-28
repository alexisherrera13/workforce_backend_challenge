class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "user created successfully"
      session[:user_id] = @user.id
      redirect_to controller: :organisations, action: :index
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:notice] = "user created successfully"
      redirect_to controller: :organisations, action: :index
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end
end
