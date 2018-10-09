class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page_num
      t.string :date_published
      t.integer :author_id
      t.timestamps
    end
  end
end
