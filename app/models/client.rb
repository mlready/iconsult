class Client < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  has_many :contracts
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
