require 'rails_helper'

RSpec.describe "PointOfInterests", type: :request do
  describe "GET /point_of_interests" do
    xit "get a list of point_of_interest" do
      points = create_list :point_of_interest, 2
      get point_of_interests_path(format: :json)
      expect(JSON.parse(response.body)).to eq JSON.parse(points.to_json).
                                              map do |el|
        el.merge('path' => point_of_interest_path(el['id'], format: :json))
      end.to_a
    end
  end
end
