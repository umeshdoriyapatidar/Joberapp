class JobsController < ApplicationController
  def index
    @jobs=Job.all 
  end

  def new
    @job=Job.new
  end

  def show
    @job=Job.find(params{:id})
  end

  def create
    @job=Job.new(params[:id])
    if @job.save
      render 'index'
    else
      render new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
