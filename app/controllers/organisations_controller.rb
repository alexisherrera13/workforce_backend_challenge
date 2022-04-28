class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save!
      flash[:notice] = "organisation created"
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update!(organisation_params)
      flash[:notice] = "organisation updated"
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to action: "index"
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
