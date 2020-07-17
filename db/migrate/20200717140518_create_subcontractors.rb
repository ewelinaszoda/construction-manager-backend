class CreateSubcontractors < ActiveRecord::Migration[6.0]
  def change
    create_table :subcontractors do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :description
      t.integer :project_id

      t.timestamps
    end
  end
end
