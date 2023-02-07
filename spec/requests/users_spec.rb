require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "not render 'show' template" do
      expect(response).to_not render_template('show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('Number of posts:')
    end
  end
end
