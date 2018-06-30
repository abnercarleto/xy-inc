require 'rails_helper'

RSpec.describe PointOfInterestsController, type: :controller do
  let(:valid_attributes) { attributes_for :point_of_interest }
  let(:invalid_attributes) { attributes_for :point_of_interest, name: nil }

  describe "GET #index" do
    it "returns a success response" do
      create :point_of_interest
      get :index, params: {}, format: :json
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      point_of_interest = create :point_of_interest
      get :show, params: {id: point_of_interest.to_param}, format: :json
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new point_of_interest" do
        expect {
          post :create, params: {point_of_interest: valid_attributes}, format: :json
        }.to change(PointOfInterest, :count).by(1)
      end

      it "renders a JSON response with the new point_of_interest" do
        post :create, params: {point_of_interest: valid_attributes}, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new point_of_interest" do

        post :create, params: {point_of_interest: invalid_attributes}, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for :point_of_interest, x: 2, y: 10 }

      it "updates the requested point_of_interest" do
        point_of_interest = create :point_of_interest
        put :update, params: {id: point_of_interest.to_param, point_of_interest: new_attributes}, format: :json
        point_of_interest.reload
        expect(point_of_interest.name).to eq new_attributes[:name]
        expect(point_of_interest.x).to eq new_attributes[:x]
        expect(point_of_interest.y).to eq new_attributes[:y]
      end

      it "renders a JSON response with the point_of_interest" do
        point_of_interest = create :point_of_interest
        put :update, params: {id: point_of_interest.to_param, point_of_interest: new_attributes}, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the point_of_interest" do
        point_of_interest = create :point_of_interest
        put :update, params: {id: point_of_interest.to_param, point_of_interest: invalid_attributes}, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested point_of_interest" do
      point_of_interest = create :point_of_interest
      expect {
        delete :destroy, params: {id: point_of_interest.to_param}, format: :json
      }.to change(PointOfInterest, :count).by(-1)
    end
  end

end
