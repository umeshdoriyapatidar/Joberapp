module JobsHelper
  def applied_job
    @jobs=Job.find_by(current_applicant)
  end
  def valid_employee?(employee_id,job_id)
    job=Job.find(job_id)
    if employee_id==job.employee_id
      true
    else
      false
    end
  end
  
end
