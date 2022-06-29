class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    # jobs_index_path
    new_job_path
  end

  protected
    def configure_permitted_parameters
      attributes = [:name, :skills,:address, :email, :description]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

end
