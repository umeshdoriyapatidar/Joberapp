class AppliesController < ApplicationController
include AppliesHelper
before_action :current_employee, only: [:accept, :rejected]
  def index
    if current_applicant   #it will show all applied job by current user
      @jobs=Applicant.find(current_applicant.id).jobs
    end
  end
  def show
    if current_applicant   #it will show all applied job by current user
      @jobs=Applicant.find(params[:id]).jobs
    end
  end
  def create
    @job=Job.find(params[:job_id]) #it's geting job_id from current user for applying new job through job show page
    current_applicant.apply(@job)
    if is_applied(current_applicant.id,@job.id)
      current_applicant.applies.find_by(job_id:@job.id).update(apply_date:Time.now)
    end
    # respond_to do |format|
    #   format.html { redirect_to  }
    #   format.js
    # end
    render 'jobs/show'
  end
  def accept
    # accept_job((jobs_id=params[:jobs_id]), (user_id=params[:user_id]))
    job_application=Apply.find_by(job_id:params[:jobs_id],applicant_id:params[:user_id])
    job_application.accepted!
  end
  def rejected
    job_application=Apply.find_by(job_id:params[:jobs_id],applicant_id:params[:user_id])
    job_application.rejected!
    job_application.delete
  end
  def destroy
    @job=Job.find(params[:id])  #it's getting job_id from current user for cancling job application through job show page
    current_applicant.applies.destroy_by(job_id:@job.id)
    flash[:danger]= "apply removed succesfully"
    redirect_to root_url
  end
end
