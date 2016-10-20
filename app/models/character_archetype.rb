class CharacterArchetype < ApplicationRecord
  has_many :characters

  def as_json(options={})
    super(only: [:name, :description, :typical_traits])
  end
end
