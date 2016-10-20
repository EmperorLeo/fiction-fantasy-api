class CreateStoryPlaceSettingsEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :story_place_settings_entries do |t|
      t.references :story_template, foreign_key: true
      t.references :story_place_setting, foreign_key: true

      t.timestamps
    end
  end
end
