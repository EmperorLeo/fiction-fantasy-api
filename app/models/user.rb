class User < ApplicationRecord
  has_secure_password
  has_many :stories, foreign_key: "user_id", class_name: "StoryTemplate"

  def as_json(options={})
    super(only: [:id, :first_name, :last_name, :email, :phone_number, :author_picture_url, :author_profile])
  end

end
