class Consultant < ActiveRecord::Base
  attr_accessible :city, :first_name, :image, :last_name, :state, :street, :zipcode
  has_many :contracts
  
end
