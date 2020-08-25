class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Jobs.find(params[:id])
  end

  def new
    @job = Job.new
  end
end
