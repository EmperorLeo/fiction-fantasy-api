class AddTraitsToCharacterArchetypes < ActiveRecord::Migration[5.0]
  def change
    add_column :character_archetypes, :typical_traits, :string, array: true
  end
end
