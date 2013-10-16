class Sponsor < ActiveRecord::Base
  validates_presence_of :name, :sort_index
  validates_inclusion_of :level, :in => %w(Gold Silver Bronze),
      :message => "%{value} is not a valid sponsorship level",
      :allow_nil => true,
      :allow_blank => true
  validates_uniqueness_of :sort_index

  after_save    :expire_sponsor_all_cache
  after_destroy :expire_sponsor_all_cache

  def self.all_cached
    Rails.cache.fetch('Sponsor.all') { all.sort_by &:sort_index }
  end
  private
    def expire_sponsor_all_cache
      Rails.cache.delete('Sponsor.all')
    end
end
