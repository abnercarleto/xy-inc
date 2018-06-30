require "rails_helper"

RSpec.describe PointOfInterestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/point_of_interests").to route_to("point_of_interests#index")
    end


    it "routes to #show" do
      expect(:get => "/point_of_interests/1").to route_to("point_of_interests#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/point_of_interests").to route_to("point_of_interests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/point_of_interests/1").to route_to("point_of_interests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/point_of_interests/1").to route_to("point_of_interests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/point_of_interests/1").to route_to("point_of_interests#destroy", :id => "1")
    end

  end
end
