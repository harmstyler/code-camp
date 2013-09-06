class SpeakersController < ApplicationController
  # /speakers
  def index
    @speakers = Speaker.where(display: true)
  end
  # /speakers/:id
  def show
    @speaker = Speaker.find(params[:id])
  end
end
