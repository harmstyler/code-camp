class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
  belongs_to :session_time
  belongs_to :session_room

  before_save :slugify
  after_save    :expire_session_all_cache
  after_destroy :expire_session_all_cache

  HIDDEN = "hidden"
  VISIBLE = "visible"

  SPEAKER_DECK_API = "https://speakerdeck.com/oembed.json"
  SLIDE_SHARE_API = "http://www.slideshare.net/api/oembed/2"

  def to_s
    title
  end
  def display
    speaker.display
  end
  def state
    display ? VISIBLE : HIDDEN
  end
  def summary
    summary = ''
    if abstract?
      length = abstract.length
      summary = abstract.clone
      summary = ActionView::Base.full_sanitizer.sanitize(summary)
      if length > 140
        summary.slice! 140..-1
        summary += '...'
      end
    end
    summary
  end
  def self.all_cached
    Rails.cache.fetch('Session.all') { where(speaker_id: Speaker.where(display: true)).order("title ASC") }
  end
  def iframe
    if !self.speaker_deck?
      return ''
    end
    uri = if self.speaker_deck.include? "speakerdeck.com"
      URI(SPEAKER_DECK_API + '?url=' + self.speaker_deck)
    elsif self.speaker_deck.include? "slideshare.net"
      URI(SLIDE_SHARE_API + '?url=' + self.speaker_deck + '&format=json')
    else
      ''
    end
    if uri == ''
      return ''
    end
    puts uri
    Rails.cache.fetch('Session.iframe.' + self.slug) {
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)['html']
    }
  end
  private
    def slugify
      self.slug = [title.parameterize].join("-") if slug.blank?
    end
    def expire_session_all_cache
      Rails.cache.delete('Session.all')
      Rails.cache.delete('Session.iframe.' + self.slug)
    end
end
