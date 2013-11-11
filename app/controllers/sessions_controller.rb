class SessionsController < ApplicationController
  require 'net/http'
  # /sessions
  def index
    sessions_desc = "Find out about all the sessions at this year's South Dakota Code Camp"
    @sessions = Session.all_cached
    set_meta_tags :title => 'Sessions', :reverse => true,
                  :description => sessions_desc,
                  :og => {
                    :title    => "South Dakota Code Camp Sessions",
                    :description    => sessions_desc,
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
                    :description    => "#{@session.summary}",
                    :type     => 'article'
                  }
  end
end
