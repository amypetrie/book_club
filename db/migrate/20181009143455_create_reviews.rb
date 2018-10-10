class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review_title
      t.integer :rating
      t.string :review_text
      t.integer :book_id
      t.string :user_name
      t.timestamps
    end
  end
end
