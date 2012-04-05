class Address < ActiveRecord::Base
  attr_accessible :street, :house_number, :city, :postcode, :profile_id

  belongs_to :profile, :inverse_of => :address

  validates :street, :presence => true, :if => :is_member_or_more?
  validates :house_number, :presence => true, :if => :is_member_or_more?
  validates :city, :presence => true, :if => :is_member_or_more?
  validates :postcode, :presence => true, :if => :is_member_or_more?

  def is_member_or_more?
    profile and profile.is_member_or_more?
  end

end
