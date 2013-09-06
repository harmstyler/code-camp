class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
  belongs_to :session_time
  belongs_to :session_room

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
end
