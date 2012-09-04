class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string :last_name
      t.string :first_name
      t.string :street
      t.string :city
      t.string :state, :limit => 2
      t.integer :zipcode, :limit => 5
      t.string :image

      t.timestamps
    end
  end
end
