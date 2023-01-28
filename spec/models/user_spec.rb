require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: nil, bio: 'Student from Argentina', posts_counter: nil) }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should be present' do
    user = User.new
    user.name = 'Marcos'
    expect(user).to be_valid
  end

  it 'No Post counter should raise error' do
    expect(subject).to_not be_valid
  end

  it 'post counter method should be 3' do
    expect(subject.latest_posts).to eq(subject.posts)
  end
end
