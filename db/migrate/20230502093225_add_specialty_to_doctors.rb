class AddSpecialtyToDoctors < ActiveRecord::Migration[7.0]
  def change
    change_table :doctors do |t|
      t.belongs_to :specialty, foreign_key: true
    end
  end
end
