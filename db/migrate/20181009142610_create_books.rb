class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page_num
      t.integer :year_published
      t.string :img_url, :default => 'https://jhupbooks.press.jhu.edu/sites/default/files/default_images/book_1.png'

      t.timestamps
    end
  end
end
