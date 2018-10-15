class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page_num
      t.integer :year_published
      t.string :img_url, :default => 'https://orig00.deviantart.net/c9d1/f/2013/027/9/3/brown_book_by_lyotta-d5sw9q1.png'

      t.timestamps
    end
  end
end
