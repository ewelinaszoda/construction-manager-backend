class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.string :image
      t.string :description
      t.string :client
      t.string :project_manager
      t.string :site_manager
      t.string :quantity_surveyor
      t.date :start_date
      t.date :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
