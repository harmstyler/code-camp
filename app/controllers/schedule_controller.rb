class ScheduleController < ApplicationController
  # /schedule
  def index
    @session_rooms = SessionRoom.all
    @session_times = SessionTime.all
  end
end
