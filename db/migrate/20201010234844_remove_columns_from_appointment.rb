class RemoveColumnsFromAppointment < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :date, :date
    remove_column :appointments, :time, :time
  end
end
