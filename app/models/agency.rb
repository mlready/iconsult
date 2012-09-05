# == Schema Information
#
# Table name: agencies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  street     :string(255)
#  city       :string(255)
#  state      :string(2)
#  zipcode    :integer
#  phone      :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agency < ActiveRecord::Base
  attr_accessible :city, :name, :phone, :state, :street, :zipcode
  has_many :contracts
  
  validates_presence_of :name, :street, :city, :state, :zipcode, :phone
  validates_uniqueness_of :name
  validates_numericality_of :zipcode
end
