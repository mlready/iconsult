class CreateWorkActivities < ActiveRecord::Migration
  def change
    create_table :work_activities do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_hours, :precision => 8, :scale => 2
      t.references :project, :index => true

      t.timestamps
    end
  end
end
