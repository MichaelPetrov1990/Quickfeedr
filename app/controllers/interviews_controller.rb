class InterviewsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @interviews = Interview.select { |interview| interview.job_application.job == @job}
  end

  def new
    @job = Job.find(params[:id])
    @job_application = JobApplication.find(params[job_application: job_application.id])
    @interview = Interview.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:job_application_id])
    @interview = Interview.new
    @interview.job_application = @job_application
    @interview.stage = "1st Stage"
    @interview.save
    redirect_to job_job_application_interviews_path(@job, @job_application)
  end

  def show
  end

  def update

  end

  def edit

  end
end

# :index, :new, :create, :show, :update, :edit
