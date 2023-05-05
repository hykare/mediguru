class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.text :body

      t.belongs_to :doctor, foreign_key: true, null: false
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
