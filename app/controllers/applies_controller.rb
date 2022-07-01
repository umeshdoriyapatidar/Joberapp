class AppliesController < ApplicationController
  def index
  end

  def create
    @job=Job.find(params[:job_id])
    current_applicant.apply(@job)
    # respond_to do |format|
    #   format.html { redirect_to  }
    #   format.js
    # end
    render 'jobs/show'
  end

  def destroy
  end
end
