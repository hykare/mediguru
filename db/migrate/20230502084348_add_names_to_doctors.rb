class AddNamesToDoctors < ActiveRecord::Migration[7.0]
  def change
    change_table :doctors do |t|
      t.column :first_name, :string
      t.column :last_name, :string
    end
  end
end
