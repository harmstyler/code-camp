class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
  belongs_to :session_time
  belongs_to :session_room
end
