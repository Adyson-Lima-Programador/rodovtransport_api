require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before { @users = create_list(:user, 3) }
  
  describe "GET /users" do
    
    it "Consegue listar todos os usuários -> status 200 ok" do
      get users_path
      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "GET /users/{id}" do
    
    it "Consegue listar um usuário especifico -> status 200 ok" do
      get user_path"1"
      expect(response.body).to include_json(
        id: @users[0].id,
        name: @users[0].name,
        email: @users[0].email)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "POST /users" do
    
    it "Consegue criar um usuário -> status 201 created" do
      headers = {"ACCEPT" => "application/json"}
      user_params = attributes_for(:user)
      post users_path, params: {user: user_params}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: user_params.fetch(:name),
        email: user_params.fetch(:email))
        expect(response).to have_http_status(201)
    end
    
  end
  
  describe "PATCH /users/{id}" do
    
    it "Consegue atualizar um usuário -> status 200 ok" do
      headers = {"ACCEPT" => "application/json"}
      user = User.first
      user.name += " - Atualizado" # mesmo primeiro user com nome atualizado
      patch "/users/#{user.id}.json", params: {user: user.attributes}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: user.name,) 
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "DELETE /users/{id}" do
    
    it "Consegue apagar um usuário -> status 204 no content" do
      headers = {"ACCEPT" => "application/json"}
      user = User.first
      expect {delete "/users/#{user.id}.json", headers: headers}.to change(User, :count).by(-1)
      expect(response).to have_http_status(204)
    end
    
  end
  
end
