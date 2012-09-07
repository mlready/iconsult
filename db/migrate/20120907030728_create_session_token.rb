class CreateSessionToken < ActiveRecord::Migration
  def change
    add_column :consultants, :remember_token, :string
    add_index  :consultants, :remember_token
  end

end
