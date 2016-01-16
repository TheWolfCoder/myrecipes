class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, :review_text
      t.integer :rating
      t.boolean :author_visible
      t.timestamps
    end
  end
end
