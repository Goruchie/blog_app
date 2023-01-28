require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: nil, bio: 'Student from Argentina', posts_counter: nil) }

  before { subject.save }

  it 'Name should be present' do
    expect(subject).to_not be_valid
  end

  it 'No Post counter should raise error' do
    expect(subject).to_not be_valid
  end
end
