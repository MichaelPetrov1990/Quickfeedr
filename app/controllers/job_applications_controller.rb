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
      redirect_to jobs_path, notice: "Succesfully applied"
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
    @interview.stage = "rejected"
    @interview.save!
    redirect_to job_job_application_interview_path(@job, @job_application, @interview)
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
