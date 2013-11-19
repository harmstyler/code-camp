class Speaker < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email

  has_many :session, :inverse_of => :speaker

  before_save :slugify
  after_save    :expire_speaker_all_cache
  after_destroy :expire_speaker_all_cache

  scope :visible, -> { where(display: true) }
  scope :hidden, -> { where(display: false) }

  HIDDEN = "hidden"
  VISIBLE = "visible"

  def fullname
    "#{firstname} #{lastname}"
  end
  def to_s
    fullname
  end
  def state
    display ? VISIBLE : HIDDEN
  end
  def md5
    Digest::MD5.hexdigest(email)
  end
  def self.all_cached
    Rails.cache.fetch('Speaker.all') { where(display: true).order("lastname ASC") }
  end
  private
    def slugify
      self.slug = [fullname.parameterize].join("-") if slug.blank?
    end
    def expire_speaker_all_cache
      Rails.cache.delete('Speaker.all')
    end
end
