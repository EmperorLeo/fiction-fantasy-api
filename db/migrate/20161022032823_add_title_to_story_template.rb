class AddTitleToStoryTemplate < ActiveRecord::Migration[5.0]
  def change
    add_column :story_templates, :title, :string
  end
end
