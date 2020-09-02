class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
  #   @placeholder = "Search all jobs..."
    if params[:query].present?
      @jobs = Job.search_by_title_and_location(params[:query])
      # @placeholder = params[:query]
    else
      @jobs = Job.all

    end
      @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude
      }
    end
    @job = @jobs.first
  end

  def show
    @placeholder = "Search all jobs..."
    if params[:query].present?
      @jobs = Job.search_by_title_and_location(params[:query])
      @placeholder = params[:query]
    else
      @jobs = Job.all
    end
    @job = Job.find(params[:id])
    @markers = [
      {
        lat: @job.latitude,
        lng: @job.longitude
      }]
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save!
      redirect_to dashboard_path
    else
      flash[:alert] = @job.errors.messages
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to dashboard_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to dashboard_path, flash[:alert] = @job.errors.messages
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :salary, :description, :job_spec, :photo)
  end
end
