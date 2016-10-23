class AddChapterNumberToChapter < ActiveRecord::Migration[5.0]
  def change
    add_column :story_chapters, :chapter_num, :integer
    add_index :story_chapters, [:chapter_num, :story_template_id], unique: true
  end
end
