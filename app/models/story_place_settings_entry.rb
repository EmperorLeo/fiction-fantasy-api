class StoryPlaceSettingsEntry < ApplicationRecord
  belongs_to :story_template
  belongs_to :story_place_setting
end
