# == Schema Information
#
# Table name: contracts
#
#  id            :integer          not null, primary key
#  agency_id     :integer
#  client_id     :integer
#  consultant_id :integer
#  name          :string(255)
#  start_date    :date
#  end_date      :date
#  rate          :decimal(8, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Contract < ActiveRecord::Base
  attr_accessible :agency_id, :client_id, :consultant_id, :end_date, :name, :rate, :start_date
  belongs_to :agency
  belongs_to :client
  belongs_to :consultant
  has_many :projects
end
