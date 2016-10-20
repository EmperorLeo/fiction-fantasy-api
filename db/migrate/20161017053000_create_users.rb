class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40
      t.string :email, limit: 40
      t.string :phone_number, limit: 20
      t.string :author_picture_url, limit: 80
      t.text :author_profile
      t.integer :followers
      t.integer :following
      t.string :password_digest

      t.timestamps
    end
  end
end
