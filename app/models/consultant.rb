# == Schema Information
#
# Table name: consultants
#
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  first_name      :string(255)
#  street          :string(255)
#  city            :string(255)
#  state           :string(2)
#  zipcode         :integer
#  image           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  remember_token  :string(255)
#

class Consultant < ActiveRecord::Base
  attr_accessible :city, :first_name, :image, :last_name, :state, :street, :zipcode, :email, :password, :password_confirmation
  has_many :contracts
 
  has_secure_password
  
  before_save { self.email.downcase! }
  before_save :create_remember_token 
  
  validates :first_name,  :presence => true, :length => { :maximum => 50 }
  validates :last_name,  :presence => true, :length => { :maximum => 50 }
 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true
  
  private 
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
