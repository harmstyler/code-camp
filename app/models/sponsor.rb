class Sponsor < ActiveRecord::Base
  validates_presence_of :name
  validates_inclusion_of :level, :in => %w(Gold Silver Bronze),
      :message => "%{value} is not a valid sponsorship level",
      :allow_nil => true,
      :allow_blank => true

  after_save    :expire_speaker_all_cache
  after_destroy :expire_speaker_all_cache

  def self.all_cached
    Rails.cache.fetch('Sponsor.all') { all }
  end
  private
    def expire_sponsor_all_cache
      Rails.cache.delete('Sponsor.all')
    end
end
