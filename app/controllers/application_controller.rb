class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    # jobs_index_path
    applicants_index_path
  end
end
