class SpeakersController < ApplicationController
  # /speakers
  def index
    @speakers = Speaker.where(display: true)
  end
  # /speakers/:id
  def show
    @speaker = Speaker.find(params[:id])
    redirect_to_good_slug(@speaker) and return if bad_slug?(@speaker)
  end
end
