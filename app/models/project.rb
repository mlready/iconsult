class Project < ActiveRecord::Base
  attr_accessible :contract_id, :end_date, :name, :start_date
  belongs_to :contract
  has_many :work_activities
end
