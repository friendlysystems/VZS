class Photo < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user

  attr_accessible :name, :image, :user, :gallery_id

  has_attached_file :image, :styles => { :small => '260x120>', :medium => '260x180>', :large => '360x268>' }

  validates :name, :presence => true
  validates_attachment_presence :image
  validates :user, :presence => true


  def file_name
    image_file_name
  end
  def size
    image_file_size
  end
end
