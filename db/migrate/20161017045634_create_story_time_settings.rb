class CreateStoryTimeSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :story_time_settings do |t|
      t.string :name, limit: 40
      t.string :description

      t.timestamps
    end
  end
end
