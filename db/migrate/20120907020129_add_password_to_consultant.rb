class AddPasswordToConsultant < ActiveRecord::Migration
  def change
    add_column :consultants, :password, :string
    add_column :consultants, :password_digest, :string
    add_column :consultants, :email, :string
  end
end
