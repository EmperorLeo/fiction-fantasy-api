class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title, limit: 40
      t.string :picture_url, limit: 80
      t.string :author_last_name, limit: 40
      t.string :author_first_name, limit: 40
      t.references :genre, foreign_key: true
      t.integer :work_type, limit: 1

      t.timestamps
    end
  end
end
