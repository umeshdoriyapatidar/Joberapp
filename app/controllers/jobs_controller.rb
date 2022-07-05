class JobsController < ApplicationController
  before_action :employee_signed_in?, only: [:create,:destroy,:edit,:update,:new,:index]
  before_action :applicant_signed_in?, only:[:index]
  def index
    if employee_signed_in?
      @jobs=current_employee.jobs
    else
      @jobs=Job.all
    end
  end

  def new
    @job=current_employee.jobs.build

  end

  def show
    @job=Job.find(params[:id])
  end

  def create
    @job=current_employee.jobs.build(job_params)
    if @job.save
      redirect_to root_url
    else
      redirect_to new
    end
  end

  def edit
    @job=Job.find(params[:id])
  end

  def update
    @job=Job.find_by(params[job_params])
    if @job.update(job_params)
      render 'show'
    else
      redirect_to edit
    end
  end

  def destroy
    @jobs=Job.find(params[:id])
    @jobs.destroy
    flash[:danger]= "Job deleted"
    redirect_to root_url
  end
  private
    def job_params
      params.require(:job).permit(:job_title,:salary,:description,:experience)
    end
end
