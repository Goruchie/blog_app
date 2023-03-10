class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def latest_posts
    posts.order(title: :desc).limit(3)
  end

  validates_presence_of :name

  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
