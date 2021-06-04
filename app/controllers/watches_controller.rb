class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @watches = Watch.search_by_name_and_brand(params[:query])
    else
      @watches = Watch.all
    end
    @markers = @watches.geocoded.map do |watch|
      { lat: watch.latitude, lng: watch.longitude,
        info_window: render_to_string(partial: "info_window",
                                        locals: { watch: watch }),
        image_url: helpers.image_url('watch_marker.png') }
    end
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    if @watch.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    redirect_to user_path
  end

  private

  def watch_params
    params.require(:watch).permit(:name, :brand, :price, :photo)
  end
end
