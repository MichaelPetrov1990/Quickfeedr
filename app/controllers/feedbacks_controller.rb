class FeedbacksController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:job_application_id])
    # @interview = Interview.find(params[:interview_id])
    @feedback = Feedback.new
    @feedback.interview = @job_application.interview

    if @job_application.interview.stage == "Rejected"
      @feedback.message = "I am sorry you have been unsuccesfull with this job application"
    elsif @job_application.interview.stage == "1st Stage"
      @feedback.message = "Congratulatons you have been invited to an interview"
    else
      @feedback.message = "Your application is still being reviewed"
    end
    @feedback.save
    redirect_to job_job_application_interviews_path(@job, @job_application, @job_application.interview), notice: "Succesfully sent feedback"
    # jobs/:job_id/job_applications/:job_application_id/interviews/:id
  end
end
