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
    it "loads all of the session rooms into @session_rooms" do
      session_room1 = SessionRoom.create!(name: "room1")
      session_room2 = SessionRoom.create!(name: "room2")

      get :index

      expect(assigns(:session_rooms)).to match_array([session_room1, session_room2])
    end
    it "loads all of the session times into @session_times" do
      session_time1 = SessionTime.create!(:time => "09:00:00.000000")
      session_time2 = SessionTime.create!(:time => "10:00:00.000000")

      get :index

      expect(assigns(:session_times)).to match_array([session_time1, session_time2])
    end
  end
end
