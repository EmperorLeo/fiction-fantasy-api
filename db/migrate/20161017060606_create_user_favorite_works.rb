class CreateUserFavoriteWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorite_works do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true
      t.string :favorite_desc

      t.timestamps
    end
  end
end
