# == Schema Information
#
# Table name: consultants
#
#  id         :integer          not null, primary key
#  last_name  :string(255)
#  first_name :string(255)
#  street     :string(255)
#  city       :string(255)
#  state      :string(2)
#  zipcode    :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Consultant < ActiveRecord::Base
  attr_accessible :city, :first_name, :image, :last_name, :state, :street, :zipcode
  has_many :contracts
  
end
