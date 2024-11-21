require 'rails_helper'

RSpec.describe "SafetyChecks", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/safety_check/show"
      expect(response).to have_http_status(:success)
    end
  end

end
