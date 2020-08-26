class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def recruitment_dashboard
    @user = current_user
    search
  end

  def my_profile
    @user = current_user
  end

  private

  def search
    if params[:query].present?
      @jobs = Job.search_by_title_and_location(params[:query])
    else
      @jobs = Job.where(user: @user)
    end
  end
end
