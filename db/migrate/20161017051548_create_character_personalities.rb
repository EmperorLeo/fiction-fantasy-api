class CreateCharacterPersonalities < ActiveRecord::Migration[5.0]
  def change
    create_table :character_personalities do |t|
      t.string :name, limit: 40
      t.string :description

      t.timestamps
    end
  end
end
