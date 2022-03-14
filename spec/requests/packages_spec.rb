require 'rails_helper'

RSpec.describe "Packages", type: :request do
  
  before { @packages = create_list(:package, 3) }
  
  describe "GET /packages" do
    
    it "Consegue listar todos os pacotes -> status 200 ok" do
      get packages_path
      expect(JSON.parse(response.body).size).to eq(3) # Verifica tamanho da resposta
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "GET /packages/{id}" do
    
    it "Consegue listar um pacote especifico -> status 200 ok" do
      get package_path"1"
      expect(response.body).to include_json(
        id: @packages[0].id,
        content: @packages[0].content,
        status: @packages[0].status)
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "POST /packages" do
    
    it "Consegue criar um pacote -> status 201 created" do
      headers = {"ACCEPT" => "application/json"}
      package_params = attributes_for(:package)
      post packages_path, params: {package: package_params}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        content: package_params.fetch(:content),
        status: package_params.fetch(:status))
        expect(response).to have_http_status(201)
    end
    
  end
  
<<<<<<< HEAD
  describe "PATCH /packages/{id}" do
    
    it "Consegue atualizar um pacote -> status 200 ok" do
      headers = {"ACCEPT" => "application/json"}
      package = Package.first
      package.content += " - Atualizado" # mesmo primeiro package com content atualizado
      patch "/packages/#{package.id}.json", params: {package: package.attributes}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        content: package.content,) 
      expect(response).to have_http_status(200)
    end
    
  end
  
=======
>>>>>>> 5fd2e334ee531705bd14a998c513037a067d95e6
end
