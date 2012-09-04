class Agency < ActiveRecord::Base
  attr_accessible :city, :name, :phone, :state, :street, :zipcode
  has_many :contracts
  
  validates_presence_of :name, :street, :city, :state, :zipcode, :phone
  validates_uniqueness_of :name
  validates_numericality_of :zipcode
end
