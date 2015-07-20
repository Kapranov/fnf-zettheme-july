require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET #404" do
    it "returns http success" do
      get :code => "404"
      expect(response).to have_http_status(:success)
    end
  end

end
