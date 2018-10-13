class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :author_img_url, :default => 'https://jhupbooks.press.jhu.edu/sites/default/files/default_images/book_1.png'

      t.timestamps
    end
  end
end
