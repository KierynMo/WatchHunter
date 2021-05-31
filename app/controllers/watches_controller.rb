class WatchesController < ApplicationController
  def index
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def watch_params
  end
end
