# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  has_many :contracts
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
