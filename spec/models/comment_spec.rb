require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', comments_counter_id: 0)
  subject { Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!') }
  before { subject.save }

  it 'posts_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should increase in 1' do
    post.comments_counter_id = nil
    expect(post).to_not be_valid
  end
end
