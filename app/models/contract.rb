class Contract < ActiveRecord::Base
  attr_accessible :agency_id, :client_id, :consultant_id, :end_date, :name, :rate, :start_date
  belongs_to :agency
  belongs_to :client
  belongs_to :consultant
  has_many :projects
end
