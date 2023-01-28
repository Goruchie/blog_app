class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def recent_posts
    posts.order(title: :desc).limit(3)
  end

  validates :name, presence: true

  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
