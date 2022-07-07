class ApplyConfirmationMailer < ApplicationMailer
  #  default from: 'jober@email.com'

  def accept_confirmation_email
    @applicant= params[:applicant]
    @job= params[:job]

    mail(to: @applicant.email, subject: "Your application has been accepted succesfully")
  end
  def apply_confirmation_email
    @applicant=params[:applicant]
    @job=params[:job]
    @employee=params[:employee]
    mail(to: @employee.email, subjec:"Application recieve")
  end

end
