class ShiftsController < ApplicationController
  def index
    if params[:query_name].present? && params[:query_starts_at].present? && params[:query_ends_at].present?
      @shifts = @shifts = Shift.joins(:user).where("name LIKE ? ", params[:query_name]).where("start BETWEEN ? AND ?", params[:query_starts_at], params[:query_ends_at]).order(start: :desc)
    elsif params[:query_starts_at].present? && params[:query_ends_at]
      @shifts = Shift.where("start BETWEEN ? AND ?", params[:query_starts_at], params[:query_ends_at]).order(start: :desc)
    elsif params[:query_name].present?
      @shifts = Shift.joins(:user).where("name LIKE ?", params[:query_name]).order(start: :desc)
    else
      @shifts = Shift.all.order(start: :desc)
    end
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    if @shift.save!
      flash[:notice] = "shift created!"
      redirect_to :action => "index"
    else
      render "new"
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update!(shift_params)
      redirect_to :action => "index"
    else
      redirect_to :action => "edit"
    end
  end

  def destroy
    @shift = Shift.find(params[:id]).destroy
    redirect_to :action => "index"
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length, :user_id, :shift_date, :start_time, :finish_time)
  end
end
