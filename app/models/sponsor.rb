class Sponsor < ActiveRecord::Base
    validates_presence_of :name
    validates_inclusion_of :level, :in => %w(Gold Silver Bronze),
        :message => "%{value} is not a valid sponsorship level",
        :allow_nil => true,
        :allow_blank => true
end
