class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.references :user, index: true, unique: true, foreign_key: { on_delete: :cascade }
      t.integer :page_animation, limit: 1
      t.integer :website_theme_1
      t.integer :website_theme_2
      t.integer :website_theme_3
      t.integer :website_theme_4

      t.timestamps
    end
  end
end
