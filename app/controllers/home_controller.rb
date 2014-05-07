class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def admin
  	@camps = Camp.upcoming.active.chronological.paginate(:page => params[:page]).per_page(10)
  	@inactive_camps = Camp.inactive.count
  	@inactive_instructors = Instructor.inactive.count
  	@inactive_locations = Location.inactive.count
  	@inactive_families = Family.inactive.count
  	@inactive_students = Student.inactive.count
  end

  def instructor_dash

  end
  
end
