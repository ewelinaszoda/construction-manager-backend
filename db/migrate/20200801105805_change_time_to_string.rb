class ChangeTimeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :meetings, :start_time, :string
    change_column :meetings, :end_time, :string
  end
end


rails db:migrate
