class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
  belongs_to :session_time
  belongs_to :session_room

  before_save :slugify
  after_save    :expire_contact_all_cache
  after_destroy :expire_contact_all_cache

  HIDDEN = "hidden"
  VISIBLE = "visible"

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
    if abstract
      length = abstract.length
      summary = abstract
      if length > 140
        summary.slice! 140..-1
        summary += '...'
      end
    end
    summary
  end
  def self.all_cached
    Rails.cache.fetch('Session.all') { Session.where(speaker_id: Speaker.where(display: true)).order("title ASC") }
  end
  private
    def slugify
      self.slug = [title.parameterize].join("-") if slug.blank?
    end
    def expire_session_all_cache
      Rails.cache.delete('Session.all')
    end
end
