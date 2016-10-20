class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :story_template, foreign_key: true
      t.string :full_name
      t.string :nickname, limit: 20
      t.text :background_info, limit: 512
      t.integer :character_type, limit: 1
      t.references :character_archetype, foreign_key: true
      t.string :hair_color, limit: 40
      t.string :eye_color, limit: 40
      t.string :species, limit: 40
      t.string :planet, limit: 40
      t.string :nationality, limit: 40
      t.string :ancestry, limit: 40
      t.string :occupation, limit: 40
      t.integer :orientation, limit: 1
      t.string :gender, limit: 40
      t.integer :personality_traits, array: true

      t.timestamps
    end
  end
end
