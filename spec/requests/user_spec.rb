require 'rails_helper'
require 'spec_helper'
require 'simplecov'

# Previous content of test helper now starts here
# require 'support/api_helper'

RSpec.describe 'User', type: :request do       
	before(:each) do 
	  @user = FactoryBot.create(:user) 
	end   

  describe 'create' do  # (almost) plain English
    it 'can create user' do
      post '/users', params: {user_name: @user.user_name, password: @user.password}
    end
  end


  describe 'GET #index' do
    it 'shold returns a list of all users' do
      get '/users'
       expect(response).to have_http_status(201)
            users = JSON.parse(response.body)
           expect(users)
          expect(users.all?)
    end
  end
end