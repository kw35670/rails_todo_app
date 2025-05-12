require 'rails_helper'

RSpec.describe "Teams", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/teams/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/teams/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
