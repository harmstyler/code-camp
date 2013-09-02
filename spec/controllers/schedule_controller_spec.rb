require "spec_helper"

describe ScheduleController do
  describe "schedule route" do
    it "routes get /schedule to schedule#index" do
      expect(:get => "/schedule").to route_to(
        :controller => "schedule",
        :action => "index",
      )
    end
  end
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
