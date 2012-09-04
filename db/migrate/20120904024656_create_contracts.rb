class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :agency_id
      t.integer :client_id
      t.integer :consultant_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.decimal :rate, :precision => 8, :scale => 2

      t.timestamps
    end

    foreign_key(:contracts, :agency_id, :agencies)
    foreign_key(:contracts, :client_id, :clients)
    foreign_key(:contracts, :consultant_id, :consultants)
      
    
  end
end
