module JobsHelper
  def applied_job
    @jobs=Job.find_by(current_applicant)
  end
end
