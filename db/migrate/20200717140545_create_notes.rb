class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.integer :project_id

      t.timestamps
    end
  end
end
