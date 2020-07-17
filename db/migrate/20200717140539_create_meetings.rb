class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :description
      t.integer :project_id

      t.timestamps
    end
  end
end
