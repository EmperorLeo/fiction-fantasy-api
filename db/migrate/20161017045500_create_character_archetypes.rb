class CreateCharacterArchetypes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_archetypes do |t|
      t.string :name, limit: 40
      t.text :description, limit: 512

      t.timestamps
    end
  end
end
