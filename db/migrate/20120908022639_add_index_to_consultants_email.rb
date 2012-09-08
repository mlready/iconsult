class AddIndexToConsultantsEmail < ActiveRecord::Migration
  def change
    add_index :consultants, :email, unique: true
  end
end
