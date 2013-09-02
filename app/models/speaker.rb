class Speaker < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email
  def fullname
    "#{firstname} #{lastname}"
  end
  def to_s
    fullname
  end
end
