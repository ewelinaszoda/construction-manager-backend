class CreateSubcontractorMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :subcontractor_meetings do |t|
      t.integer :subcontractor_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
