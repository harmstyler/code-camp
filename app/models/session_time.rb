class SessionTime < ActiveRecord::Base
    validates_presence_of :time
    def to_s
      time.strftime("%l:%M %p")
    end
end
