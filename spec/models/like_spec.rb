require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Marcos', photo: 'https://www.linkedin.com/in/marcosgualtero/',
                     bio: 'Student from Argentina.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', likes_counter_id: 0)
  subject { Like.new(author_id: user.id, post_id: post.id) }
  before { subject.save }

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should increase in 1' do
    post.likes_counter_id = nil
    expect(post).to_not be_valid
  end
end
