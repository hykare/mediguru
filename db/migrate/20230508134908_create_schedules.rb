class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.text :content
      t.belongs_to :doctor, foreign_key: true, null: false

      t.timestamps
    end
  end
end
