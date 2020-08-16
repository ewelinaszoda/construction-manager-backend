class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :date
      t.string :start_time
      t.string :end_time
      t.string :location
      t.string :description
      t.integer :project_id

      t.timestamps
    end
  end
end
