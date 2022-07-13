class ApplicantsController < ApplicationController
  def index
    if current_employee   #it will show all the applicants who applied for a job to employee
      @job_application=Apply.where(job_id:params[:id])
    end
  end

  def new
    @applicant=Applicant.new
  end

  def show
    if current_employee
      @applicant=Applicant.find(params[:id])   #it will show the applicant's detail to employee
    elsif current_applicant
      @applicant=Applicant.find(current_applicant.id) #it will show the details of current applicant to current applicant
    end
  end
  def create
    @applicant=Applicant.new(params[:id])
    if @applicant.save
      loged_in @applicant
      redirect_to 'index'
    else
      render 'new'
    end
  end

  
end
