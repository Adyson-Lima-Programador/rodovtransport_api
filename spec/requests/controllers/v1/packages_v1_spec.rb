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
  
  
  
end