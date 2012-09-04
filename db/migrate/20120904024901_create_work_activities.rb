class CreateWorkActivities < ActiveRecord::Migration
  def change
    create_table :work_activities do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_hours, :precision => 8, :scale => 2
      t.integer :project_id

      t.timestamps
    end
    
    foreign_key(:work_activities, :project_id, :projects)
    
  end
end
