class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :contract_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    
    foreign_key(:projects, :contract_id, :contracts)
    
  end
end
