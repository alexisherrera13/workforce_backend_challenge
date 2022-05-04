class OrganisationsController < ApplicationController
  def index
    require_user
    @organisations = Organisation.all
  end

  def new
    require_user
    @organisation = Organisation.new
  end

  def create
    require_user
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      flash[:notice] = "organisation created"
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def edit
    require_user
    @organisation = Organisation.find(params[:id])
  end

  def update
    require_user
    @organisation = Organisation.find(params[:id])
    if @organisation.update(organisation_params)
      flash[:notice] = "organisation updated"
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    require_user
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to action: "index"
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
