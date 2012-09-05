# == Schema Information
#
# Table name: work_activities
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  total_hours :decimal(8, 2)
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WorkActivity < ActiveRecord::Base
  attr_accessible :contract_id, :end_date, :start_date, :total_hours
  belongs_to :project
end
