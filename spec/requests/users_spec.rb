require 'rails_helper'
RSpec.describe 'Users', type: :request do
  user = User.new(name: 'Anything',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Anything test',
    posts_counter: 0)
  user.save

  describe 'User GET/ index ' do
    it 'return user http success' do
      get '/users/'
      expect(response).to have_http_status(200)
    end

    it 'rendered user template' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'user responsed body with correct place holder' do
      get '/users/'
      expect(response.body).to include('Users Page. Here is a list of all users. Select from users')
    end
  end
  describe "User GET /show'" do
    it 'return success for detail user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end
    it 'rendered user detail template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
    it 'user detail responsed body with correct place holder' do
      get "/users/#{user.id}"
      expect(response.body).to include('Here is user index 1 page')
    end
  end
end











# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'Get index route of users controller' do
#     it 'returns http success' do
#       get '/users/'
#       expect(response).to have_http_status(:success)
#     end

#     it 'Renders the right template index' do
#       get '/'
#       expect(response).to render_template(:index)
#     end
#   end

#   describe 'Rendering the show page for the show routes' do
#     before :each do
#       get '/users/:id'
#     end

#     it 'Returns success status for show routes' do
#       expect(response).to have_http_status(:success)
#     end

#     it 'Returns or renders the show template' do
#       expect(response).to render_template(:show)
#     end
#   end
# end