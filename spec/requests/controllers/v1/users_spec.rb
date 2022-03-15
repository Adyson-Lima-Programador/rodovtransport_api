require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  
  before { @users = create_list(:user, 3) }
  
  describe "GET /users" do
    
    it "Consegue listar todos os usuários -> status 200 ok" do
      get :index
      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "GET /users/{id}" do
    
    it "Consegue listar um usuário especifico -> status 200 ok" do
      get :show, params: {id: @users[0].id}
      expect(response.body).to include_json(
        id: @users[0].id,
        name: @users[0].name,
        email: @users[0].email)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "POST /users" do
    
    it "Consegue criar um usuário -> status 201 created" do
      user_params = attributes_for(:user)
      post :create, params: {user: user_params}
      expect(response.body).to include_json(
        id: /\d/,
        name: user_params.fetch(:name),
        email: user_params.fetch(:email))
        expect(response).to have_http_status(201)
    end
    
  end
  
  describe "PATCH /users/{id}" do
    
    it "Consegue atualizar um usuário -> status 200 ok" do
      user = User.first
      user.name += " - Atualizado"
      expect { patch :update, params: { id: user.id } }
      expect(response).to have_http_status(200)
    end
    
  end
  
  
  
end