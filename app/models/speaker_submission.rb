class SpeakerSubmission < ActiveRecord::Base
  validates_presence_of :name, :email, :title, :abstract
end
