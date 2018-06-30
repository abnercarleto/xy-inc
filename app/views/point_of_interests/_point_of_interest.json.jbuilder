json.extract! point_of_interest, :id, :name, :x, :y, :created_at, :updated_at
json.path point_of_interest_path(point_of_interest, format: :json)
