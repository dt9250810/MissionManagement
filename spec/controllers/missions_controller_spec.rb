require 'rails_helper'

RSpec.describe MissionsController, type: :controller do
  before(:all) do
    @mission = Mission.create(title: "rspec_test1", context: "this is testing context.")
  end

  it "#index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "#new" do
    get :new
    expect(response).to have_http_status(200)
  end

  it "#edit" do
    get :edit, params: { id: @mission[:id] }
    expect(response).to have_http_status(200)
  end

  describe "#create" do
    before(:all) do
      @mission_params = { title: "title", context: "context" }
    end

    it "creates record" do
      expect {
         post :create, params: { mission: @mission_params }
      }.to change{ Mission.all.size }.by(1)
    end

    it "redirect on success" do
      post :create, params: { mission: @mission_params }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_missions_path(current_user))
    end
  end
  
end
