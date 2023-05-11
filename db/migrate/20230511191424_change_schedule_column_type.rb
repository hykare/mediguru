class ChangeScheduleColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:schedules, :content, :json, using: 'content::json', null: false, default: '[]')
  end
end
