class WorkActivity < ActiveRecord::Base
  attr_accessible :contract_id, :end_date, :start_date, :total_hours
  belongs_to :project
end
