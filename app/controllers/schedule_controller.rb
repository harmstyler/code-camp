class ScheduleController < ApplicationController
  # /schedule
  def index
    @session_rooms = SessionRoom.all.order("name ASC")
    @session_times = SessionTime.all.order("time ASC")
  end
end
