class ScheduleController < ApplicationController
  # /schedule
  def index
    @session_rooms = SessionRoom.all.order("name ASC")
    @session_times = SessionTime.all.order("time ASC")
    @schedule = []
    @session_times.each do |session_time|
      # @schedule.push(session_time)
      rooms = []
      @session_rooms.each do |room|
        @session = Session.where(speaker_id: Speaker.where(display: true)).find_by session_time_id: session_time.id, session_room_id: room.id
        if @session
          rooms.push(@session)
        else
          rooms.push('')
        end
      end
      @schedule.push(rooms)
    end
    schedule_desc = "SDCC Schedule - An event in Sioux Falls, SD."
    set_meta_tags :title => '2013 Schedule', :reverse => true,
              :description => schedule_desc,
              :og => {
                :title    => "South Dakota Code Camp Schedule 2013",
                :description    => schedule_desc,
                :type     => 'article'
              }
  end
end
