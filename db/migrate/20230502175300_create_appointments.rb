class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time, null: false
      t.interval :duration, null: false

      t.belongs_to :doctor, foreign_key: true, null: false
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
