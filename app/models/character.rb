class Character < ApplicationRecord
  belongs_to :story_template
  belongs_to :character_archetype
end
