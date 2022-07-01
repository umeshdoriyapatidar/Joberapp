module AppliesHelper
  def is_applied(current_applicant_id,job_id)
    @application=Apply.where(applicant_id:current_applicant_id)
    if @application.find_by(job_id:job_id)
      true
    else
      false
    end
  end
end
