require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  user = User.new(name: 'Anything',
                  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Anything test',
                  posts_counter: 0)
  user.save
  post = Post.new(
    title: 'Title 1',
      text: 'Text 1',
      author: user,
      comments_counter: 0,
      likes_counter: 0
  )
  post.save

  describe 'Post GET /index' do
    it 'return post http success' do
      get "/users/#{user.id}/posts/"
      expect(response).to have_http_status(200)
    end
    it 'rendered post template' do
      get "/users/#{user.id}/posts/"
      expect(response).to render_template(:index)
    end
    it 'post responsed body with correct place holder' do
      get "/users/#{user.id}/posts/"
      expect(response.body).to include('Posts attached to a user Page. Here is a list of the user post. Select from posts')
    end
  end
  describe 'Post GET /show' do
    it 'return success for detail post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'rendered post detail template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'post detail responsed body with correct place holder' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Here is a particular posts of index 4 for a user 1')
    end
  end
end

















# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     it 'returns http success' do
#       get '/posts/index'
#       expect(response).to have_http_status(:success)
#     end
#   end
# end



# require 'rails_helper'

# RSpec.describe 'Post', type: :request do
#   describe 'Get post Index' do
#     before :each do
#       get '/users/:user_id/posts/'
#     end

#     it 'Returns http status of success for post index' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'Render the right index template for post' do
#       expect(response).to render_template(:index)
#     end

#     describe 'Get all related routes to post show template' do
#       before :each do
#         get '/users/:user_id/posts/id'
#       end

#       it 'Returns success status for show routes of the post controller' do
#         expect(response).to have_http_status(:success)
#       end

#       it 'Renders the show page for the post controller' do
#         expect(response).to render_template(:show)
#       end
#     end
#   end
# end
