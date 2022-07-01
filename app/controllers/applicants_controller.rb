class ApplicantsController < ApplicationController
  def index
    @applicants=Applicant.all
  end

  def new
    @applicant=Applicant.new
  end

  def show
    @applicant=Applicant.find(params[:id])
  end

  def create
    @applicant=Applicant.new(params[:id])
    if @applicant.save
      loged_in @applicant
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
