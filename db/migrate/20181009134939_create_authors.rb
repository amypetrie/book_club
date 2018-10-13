class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :author_img_url, :default => 'https://heafeyheafey.com/wp-content/uploads/2017/01/generic-profile-avatar_352864.jpg'

      t.timestamps
    end
  end
end
