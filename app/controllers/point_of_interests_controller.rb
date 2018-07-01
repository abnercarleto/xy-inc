class PointOfInterestsController < ApplicationController
  before_action :set_point_of_interest, only: [:show, :update, :destroy]

  def index
    @point_of_interests = PointOfInterest.all
  end

  def closeness
    @point_of_interests = PointOfInterest.
                          closeness(*params.require([:x, :y, :max_distance]).map(&:to_i))
    render :index
  end

  def show
  end

  def create
    @point_of_interest = PointOfInterest.new(point_of_interest_params)
    @point_of_interest.save
    render_object @point_of_interest
  end

  def update
    @point_of_interest.update(point_of_interest_params)
    render_object @point_of_interest
  end

  def destroy
    @point_of_interest.destroy
  end

  private
    def set_point_of_interest
      @point_of_interest = PointOfInterest.find(params[:id])
    end

    def point_of_interest_params
      params.require(:point_of_interest).permit(:name, :x, :y)
    end
end
