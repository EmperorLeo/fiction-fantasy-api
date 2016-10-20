class User < ApplicationRecord
  has_secure_password
  has_many :stories, foreign_key: "user_id", class_name: "StoryTemplate"
end
