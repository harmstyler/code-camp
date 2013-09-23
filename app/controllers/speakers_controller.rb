class SpeakersController < ApplicationController
  # /speakers
  def index
    speakers_desc = "Find out about the speakers at this year's South Dakota Code Camp"
    @speakers = Speaker.where(display: true)
    set_meta_tags :title => 'Speakers', :reverse => true,
              :description => speakers_desc,
              :og => {
                :title    => "South Dakota Code Camp Speakers",
                :description    => speakers_desc,
                :type     => 'article'
              }
  end
  # /speakers/:id
  def show
    @speaker = Speaker.find(params[:id])
    redirect_to_good_slug(@speaker) if bad_slug?(@speaker)
    set_meta_tags :title => "#{@speaker.title}", :reverse => true,
                  :description => "#{@speaker.summary}",
                  :og => {
                    :title    => "#{@speaker.title}",
                    :description    => "#{@speaker.summary}",
                    :type     => 'article'
                  }
  end
end
