class StoryTemplate < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :sequel, class_name: "StoryTemplate", foreign_key: "sequel_id"
  belongs_to :genre
  has_many :characters
  has_many :chapters, foreign_key: "story_template_id", class_name: "StoryChapter"
  has_many :story_time_settings, through: :story_time_settings_entries
  has_many :story_place_settings, through: :story_place_settings_entries
end
