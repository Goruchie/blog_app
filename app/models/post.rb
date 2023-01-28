class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
    has_many :likes, class_name: 'Like', foreign_key: 'post_id'

    def update_counter
        author.increment(posts_counter)
    end

    def return_comments
        comments.order(created_at: :desc).limit(5)
    end

end