class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state, :limit => 2
      t.integer :zipcode, :limit => 5
      t.string :phone, :limit => 10

      t.timestamps
    end
  end
end
