class FeedbacksController < ApplicationController
  def new
  end

  def create

    if job_application.interview.stage == "reject"
      feedback.stage = "I am sorry you have been unsuccesfull with this job application"
    elsif job_application.interview.stage == "1st stage"
      feedback.stage = "congratulatons you have been invited to an interview"
    else
      feedback.stage = "your application is still being reviewed"
      feedback.save!
      redirec_to
    end
  end
end
