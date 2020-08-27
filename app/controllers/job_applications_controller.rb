class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def new
    @user = current_user
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new
    @job_application.job = @job
    @job_application.user = current_user
    if @job_application.save!
      redirect_to jobs_path, notice: "Succesfully applied"
    else
      flash[]
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy

  end

  private

  def job_params
  end
end
