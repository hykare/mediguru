class AddNamesToPatients < ActiveRecord::Migration[7.0]
  def change
    change_table :patients do |t|
      t.column :first_name, :string
      t.column :last_name, :string
    end
  end
end
