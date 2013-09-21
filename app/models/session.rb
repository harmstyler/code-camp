class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
  belongs_to :session_time
  belongs_to :session_room

  before_save :slugify

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
  private
    def slugify
      self.slug = [title.parameterize].join("-") if slug.blank?
    end
end
