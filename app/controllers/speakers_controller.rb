class SpeakersController < ApplicationController
  # /speakers
  def index
    speakers_desc = "Find out about the speakers at this year's South Dakota Code Camp"
    @speakers = Speaker.where(display: true).order("lastname ASC")
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
    set_meta_tags :title => "#{@speaker}", :reverse => true,
                  :description => "#{@speaker.bio}",
                  :og => {
                    :title    => "#{@speaker}",
                    :description    => "#{@speaker.bio}",
                    :type     => 'article'
                  }
  end
end
