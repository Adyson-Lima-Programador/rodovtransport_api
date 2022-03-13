require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before { @users = create_list(:user, 3) }
  
  describe "GET /users" do
    it "Consegue listar todos os usuários -> status 200 ok" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
