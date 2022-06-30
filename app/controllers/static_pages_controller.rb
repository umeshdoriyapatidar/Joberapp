class StaticPagesController < ApplicationController
  def home
    @job = current_employee.jobs.build if employee_signed_in?
  end
end
