require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Diego', photo: 'https://avatars.githubusercontent.com/u/108556234?v=4',
                        bio: 'I´m a student', posts_counter: 2)
    visit users_path
  end

  describe 'users index page' do
    # Display all the usernames test
    it 'displays the created users' do
      expect(page).to have_content('Diego')
      expect(page).to have_content('Marcos')
      expect(page).to have_content('Tom')
    end

    # Profile picture test
    it 'shows the right photo' do
      expect(page.body).to include(@user.photo)
    end

    # Number of posts test
    it 'displays the right Number of posts' do
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 1')
    end

    it "When I click on a user, should redirected to that user's show page." do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
