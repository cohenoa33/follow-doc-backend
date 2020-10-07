class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :name
      t.references :dependent, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
