class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
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
    @interview.stage = "1st stage"
    @interview.save
    redirect_to job_job_application_interview_path(@job, @job_application, @interview)
  end

  def show

  end

  def update

  end

  def edit

  end
end

# :index, :new, :create, :show, :update, :edit
