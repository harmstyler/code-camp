class SponsorsController < ApplicationController
  def index
    sponsors_desc = "South Dakota Code Camp wouldn't be possible without such great sponsors."
    @sponsors = Sponsor.all_cached
    set_meta_tags :title => 'Sessions', :reverse => true,
                  :description => sponsors_desc,
                  :og => {
                    :title    => "South Dakota Code Camp Sessions",
                    :description    => sponsors_desc,
                    :type     => 'article'
                  }
  end
end
