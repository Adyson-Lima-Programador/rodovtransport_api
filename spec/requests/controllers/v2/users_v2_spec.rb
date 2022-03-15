require 'rails_helper'

RSpec.describe V2::UsersController, type: :controller do
  
  before { @users = create_list(:user, 3) }
  
  describe "GET /users" do
    
    it "Consegue listar todos os usuários -> status 200 ok" do
      get :index
      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(200)
    end
    
  end
  
end