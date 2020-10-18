class RemoveInfoFromDoctors < ActiveRecord::Migration[6.0]
  def change

    remove_column :doctors, :info, :text

  end
end
