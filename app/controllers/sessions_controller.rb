class SessionsController < ApplicationController
  # /sessions
  def index
    @sessions = Session.where(speaker_id: Speaker.where(display: true))
    set_meta_tags :title => 'Sessions', :reverse => true,
                  :description => 'South Dakota Code Camp Sessions',
                  :og => {
                    :title    => "South Dakota Code Camp Sessions",
                    :type     => 'article'
                  }
  end
  # /sessions/:id
  def show
    @session = Session.find(params[:id])
    redirect_to_good_slug(@session) if bad_slug?(@session)
    set_meta_tags :title => "#{@session.title}", :reverse => true,
                  :description => "#{@session.summary}",
                  :og => {
                    :title    => "#{@session.title}",
                    :type     => 'article'
                  }
  end
end
