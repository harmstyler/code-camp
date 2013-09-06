class SessionsController < ApplicationController
  # /sessions
  def index
    @sessions = Session.where(speaker_id: Speaker.where(display: true))
  end
  # /sessions/:id
  def show
    @session = Session.find(params[:id])
  end
end
