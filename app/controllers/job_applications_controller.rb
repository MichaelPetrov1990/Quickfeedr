class JobApplicationsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @job_applications = @job.job_applications
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
      redirect_to jobs_path, notice: "Succesfully applied", remote: true
    else
      flash[]
    end
  end

  def show
    @job_applications = JobApplication.all
  end

  def reject
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @interview = Interview.new
    @interview.job_application = @job_application
    @interview.stage = "Rejected"
    @interview.save!
    redirect_to job_job_application_interviews_path(@job, @job_application), notice: "Succesfully rejected job application", remote: true
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def applicants_show

  end

  private

  def job_params
  end
end
