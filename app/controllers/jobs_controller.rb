class JobsController < ApplicationController
  def index
    if params[:query].present?
      @jobs = Job.search_by_title_and_location(params[:query])
    else
      @jobs = Job.all
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save!
      redirect_to jobs_path
    else
      flash[:alert] = @job.errors.messages
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path(@job)
  end

  def edit
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :salary, :description)
  end
end
