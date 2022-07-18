class JobsController < ApplicationController
include JobsHelper
  before_action :current_employee, only: [:create,:destroy,:edit,:update,:new,:index]
  before_action :current_applicant, only:[:index,:show]
  def index
    if employee_signed_in?
      @jobs=current_employee.jobs.page params[:page]
    elsif applicant_signed_in?
      @jobs=Job.page params[:page]
    end
  end

  def new
    @job=current_employee.jobs.build

  end

  def show
    if employee_signed_in?
      if valid_employee?(current_employee.id,params[:id])
        @job=Job.find(params[:id])
      else
        redirect_to jobs_path
      end
    elsif current_applicant
      @job=Job.find(params[:id])
    else
      redirect_to root_url
    end
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
    if valid_employee?(current_employee.id,params[:id])
      @job=Job.find(params[:id])
    else
      redirect_to root_url
    end
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
    if valid_employee?(current_employee.id,params[:id])
      @jobs=Job.find(params[:id])
      @jobs.destroy
      flash[:danger]= "Job deleted"
      redirect_to root_url
    end
  end
  private
    # def valid_applicant
    #   if applicant_signed_in?
    #     return errors.add(:base, "sorry it's not validated user") unless current_applicant
    #   else
    #     redirect_to root_url
    #   end 
    
    # end 
    # def valid_employee
    #   if current_employee
    #     render 'index'
    #   else
    #     return errors.add(:base, "sorry it's not validated user") unless current_employee
        
    #   end
    # end
    def job_params
      params.require(:job).permit(:job_title,:salary,:description,:experience)
    end
end
