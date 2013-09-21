class Speaker < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email

  before_save :slugify

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
  private
    def slugify
      self.slug = [fullname.parameterize].join("-") if slug.blank?
    end
end
