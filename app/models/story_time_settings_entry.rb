class StoryTimeSettingsEntry < ApplicationRecord
  belongs_to :story_template
  belongs_to :story_time_setting
end
