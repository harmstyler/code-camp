class SessionsController < ApplicationController
  # /sessions
  def index
    @sessions = Session.where(speaker_id: Speaker.where(display: true))
  end
  # /sessions/:id
  def show
    @session = Session.find(params[:id])
    redirect_to_good_slug(@session) if bad_slug?(@session)
  end
end
