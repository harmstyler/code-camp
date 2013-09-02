class ScheduleController < ApplicationController
  # /schedule
  def index
    @session_rooms = SessionRoom.all
  end
end
