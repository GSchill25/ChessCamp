class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @upcoming_camps = Camp.upcoming.active.chronological.paginate(:page => params[:page]).per_page(10)
    @past_camps = Camp.past.chronological.paginate(:page => params[:page]).per_page(10)
    @inactive_camps = Camp.inactive.alphabetical.to_a
  end

  def show
    @instructors = @camp.instructors.alphabetical.to_a
    @students = @camp.students.alphabetical.to_a
  end

  def new
    @camp = Camp.new
    @camp.registrations.build
  end

  def edit
    @camp.start_date = humanize_date @camp.start_date
    @camp.end_date = humanize_date @camp.end_date
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @camp.update(camp_params)
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @camp.destroy
    redirect_to camps_url, notice: "#{@camp.name} camp on #{@camp.start_date.strftime('%m/%d/%y')} was removed from the system."
  end

  private
    def convert_start_and_end_dates
      params[:camp][:start_date] = convert_to_date(params[:camp][:start_date]) unless params[:camp][:start_date].blank?
      params[:camp][:end_date] = convert_to_date(params[:camp][:end_date]) unless params[:camp][:end_date].blank?
    end

    def set_camp
      @camp = Camp.find(params[:id])
    end

    def camp_params
      convert_start_and_end_dates
      params.require(:camp).permit(:curriculum_id, :location_id, :cost, :start_date, :end_date, :time_slot, :max_students, :active, :instructor_ids => [], registrations_attributes: [:id, :student_id, :payment_status, :points_earned])
    end
end
