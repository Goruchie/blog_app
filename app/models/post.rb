class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def return_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true

  validates_length_of :title, maximum: 140

  validates :comments_counter_id, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  validates :likes_counter_id, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
