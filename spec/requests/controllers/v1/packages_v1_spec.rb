require 'rails_helper'

RSpec.describe V1::PackagesController, type: :controller do
  
  before { @packages = create_list(:package, 3) }
  
  describe "GET /packages" do
    
    it "Consegue listar todos os pacotes -> status 200 ok" do
      get :index
      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "GET /packages/{id}" do
    
    it "Consegue listar um pacote especifico -> status 200 ok" do
      get :show, params: {id: @packages[0].id}
      expect(response.body).to include_json(
        id: @packages[0].id,
        content: @packages[0].content,
        status: @packages[0].status)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "POST /packages" do
    
    it "Consegue criar um pacote -> status 201 created" do
      package_params = attributes_for(:package)
      post :create, params: {package: package_params}
      expect(response.body).to include_json(
        id: /\d/,
        content: package_params.fetch(:content),
        status: package_params.fetch(:status))
        expect(response).to have_http_status(201)
    end
    
  end
  
  describe "PATCH /packages/{id}" do
    
    it "Consegue atualizar um pacote -> status 200 ok" do
      package = Package.first
      package.content += " - Atualizado"
      expect { patch :update, params: { id: package.id } }
      expect(response).to have_http_status(200)
    end
    
  end
  
  
  
end