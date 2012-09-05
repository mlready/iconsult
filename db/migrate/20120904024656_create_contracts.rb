class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :agency, :index => true
      t.references :client, :index => true 
      t.references :consultant, :index => true 
      t.string :name
      t.date :start_date
      t.date :end_date
      t.decimal :rate, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
