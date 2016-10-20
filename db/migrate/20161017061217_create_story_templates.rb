class CreateStoryTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :story_templates do |t|
      t.references :author
      t.integer :narration, limit: 1
      t.text :main_idea, limit: 2048
      t.text :intro_desc, limit: 1024
      t.text :rising_action_desc, limit: 1024
      t.text :climax_desc, limit: 1024
      t.text :conclusion_desc, limit: 1024
      t.text :world_building
      t.integer :stage, limit: 1
      t.references :sequel
      t.string :author_video_url, limit: 80
      t.string :book_cover_url, limit: 80
      t.references :genre, foreign_key: true

      t.timestamps
    end

    add_foreign_key :story_templates, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :story_templates, :story_templates, column: :sequel_id, on_delete: :nullify
  end
end
