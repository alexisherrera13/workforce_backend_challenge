class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
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
    require_user
    @user = User.find(params[:id])
  end

  def update
    require_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user updated"
      redirect_to controller: :organisations, action: :index
    else
      render "edit"
    end
  end

  def join
    require_user
    @user = User.find(params[:id])
    if params[:organisation_id].present?
      @user.organisation = Organisation.find(params[:organisation_id])
      @user.save!
      redirect_to controller: :organisations, action: :index
    else
      redirect_to controller: :organisations, action: :index
    end
  end

  def leave
    require_user
    @user = User.find(params[:id])
    @user.organisation = nil
    @user.shifts.destroy_all
    @user.save!
    redirect_to controller: :organisations, action: :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end
end
