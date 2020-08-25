class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def recruitment_dashboard
    @user = current_user
    @jobs = Job.where(user: @user)
  end


  private

  def find_jobs
  end
end
