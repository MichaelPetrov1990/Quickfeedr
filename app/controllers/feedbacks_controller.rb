class FeedbacksController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:job_application_id])
    @feedback = Feedback.new
    @feedback.interview = @job_application.interview

    if @job_application.interview.stage == "rejected"
      @feedback.message = "I am sorry you have been unsuccesfull with this job application"
    elsif @job_application.interview.stage == "1st stage"
      @feedback.message = "Congratulatons you have been invited to an interview"
    else
      @feedback.message = "Your application is still being reviewed"
    end
    @feedback.save
    redirect_to job_job_application_interviews_path(@jobs, @job_application, @job_application.interview)
  end
end
