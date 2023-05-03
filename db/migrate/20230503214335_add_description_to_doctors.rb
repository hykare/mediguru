class AddDescriptionToDoctors < ActiveRecord::Migration[7.0]
  def change
    change_table :doctors do |t|
      t.column :description, :text
    end
  end
end
