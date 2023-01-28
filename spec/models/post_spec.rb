require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Marcos', photo: 'https://www.linkedin.com/in/marcosgualtero/',
                           bio: 'Student from Argentina.', posts_counter: 0)
  subject { Post.new(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter_id: 6) }
  before { subject.save }

  it 'title length should not be too long' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should be integer' do
    subject.comments_counter_id = 'String'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be integer' do
    subject.likes_counter_id = 'String'
    expect(subject).to_not be_valid
  end

  it 'title length should not be too long' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'posts counter should increases in 1' do
    update_post = subject.update_posts_counter
    expect(update_post.posts_counter).to eql 1
  end
end
