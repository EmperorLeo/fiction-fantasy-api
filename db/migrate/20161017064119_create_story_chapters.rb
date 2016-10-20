class CreateStoryChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :story_chapters do |t|
      t.references :story_template, foreign_key: { on_delete: :cascade }
      t.string :title
      t.text :summary, limit: 512
      t.text :content

      t.timestamps
    end
  end
end
