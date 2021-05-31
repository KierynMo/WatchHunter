class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  
  def index
    
    @watches = Watch.all
  end

  def show
  end

  def new

  end

  def create
  end

  private

  def watch_params
  end
end
