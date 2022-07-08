class AppliesController < ApplicationController
include AppliesHelper
before_action :current_employee, only: [:accept, :rejected]
# before_action :verify ,only: [:create]
  def index
    if current_applicant   #it will show all applied job by current user
      # case(:scope)
      @jobs=Applicant.find(current_applicant.id).jobs
      @foo=params[:status]
    end
  end
  def show
    if current_applicant   #it will show all applied job by current user
      @jobs=Applicant.find(params[:id]).jobs
    end
  end
  def create
    # byebug
    @job=Job.find($job_id) #it's geting job_id from current user for applying new job through job show page
    current_applicant.apply(@job)
    if is_applied(current_applicant.id,@job.id)
      current_applicant.applies.find_by(job_id:@job.id).update(apply_date:Time.now)
    emp_id=@job.employee_id 
    @employee=Employee.find(emp_id)
    @applicant=current_applicant
    ApplyConfirmationMailer.with(applicant: @applicant,job: @job,employee: @employee).apply_confirmation_email.deliver
    end
    # respond_to do |format|
    #   format.html { redirect_to  }
    #   format.js
    # end
    render root_url
  end
  def accept
    # accept_job((jobs_id=params[:jobs_id]), (user_id=params[:user_id]))
    job_application=Apply.find_by(job_id:params[:jobs_id],applicant_id:params[:user_id])
    job_application.accepted!
    @applicant=Applicant.find(params[:user_id])
    @job=Job.find(params[:jobs_id])
    ApplyConfirmationMailer.with(applicant: @applicant,job: @job).accept_confirmation_email.deliver
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
  def verify
    $job_id= params[:job_id]
    otp = rand(1000..9999)
    $global_otp=otp
    @applicant=current_applicant
    ApplyConfirmationMailer.with(applicant: @applicant,ranotp: otp).send_otp.deliver
    # render 'applies/verify'
  end

  def verifyotp
    newotp=params[:apply_otp]
    current_applicant.update(apply_otp:params[:apply_otp])
    @job_id=params[:job_id]
    if $global_otp == current_applicant.apply_otp
      flash[:success]='Otp verfied succefully'
      redirect_to create
    else
      flash[:danger]='Wrong Otp'
      redirect_to root_url
    end
  end

    
end
