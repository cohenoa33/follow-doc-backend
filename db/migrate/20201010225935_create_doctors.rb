class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :state
      t.text :info
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
