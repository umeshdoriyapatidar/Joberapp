class JobsController < ApplicationController
  before_action :employee_signed_in?, only: [:create,:destroy,:edit,:update,:new,:index]
  before_action :applicant_signed_in?, only:[:index]
  def index
    if employee_signed_in?
      @jobs=Job.all.where(employee_id:current_employee.id)
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
      redirect_to index
    else
      redirect_to new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
    def job_params
      params.require(:job).permit(:job_title,:salary,:description,:experience)
    end
end
