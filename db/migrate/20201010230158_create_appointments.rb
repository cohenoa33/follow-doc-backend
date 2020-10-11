class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.text :note
      t.references :doctor, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.boolean :insurance_auth
      t.boolean :status_open

      t.timestamps
    end
  end
end
