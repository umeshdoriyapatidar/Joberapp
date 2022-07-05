module AppliesHelper
  def is_applied(current_applicant_id,job_id)
    # @application=Apply.where(applicant_id:current_applicant_id)
    if current_applicant.applies.find_by(job_id:job_id)
      true
    else
      false
    end
  end

  def accept_job(user_id,jobs_id)
    user=Apply.find_by(job_id:jobs_id,applicant_id:user_id)
    user.accepted!
  end

  def rejected_job(user_id,jobs_id)
    user=Apply.find_by(job_id:jobs_id,appicant_id:user_id)
    user.rejected!
  end

end
