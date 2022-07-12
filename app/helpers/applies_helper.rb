module AppliesHelper
  def is_applied(current_applicant_id,job_id)
    # @application=Apply.where(applicant_id:current_applicant_id)
    if current_applicant.applies.find_by(job_id:job_id)
      true
    else
      false
    end
  end
 
  
  def application_status(user_id,jobs_id)
    job_application=Apply.find_by(job_id:jobs_id,applicant_id:user_id)
    job_application.status
  end
  def applied_date(user_id,jobs_id)
    job_application=Apply.find_by(job_id:jobs_id,applicant_id:user_id)
    job_application.apply_date
  end
end
