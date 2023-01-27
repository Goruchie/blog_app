class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: 'users'}
      t.string :title
      t.string :text
      t.references :comments_counter
      t.references :likes_counter
      t.timestamps
    end
  end
end
