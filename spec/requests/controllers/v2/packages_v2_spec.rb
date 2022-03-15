require 'rails_helper'

RSpec.describe V2::PackagesController, type: :controller do
  
  before { @packages = create_list(:package, 3) }
  
  describe "GET /packages" do
    
    it "Consegue listar todos os pacotes -> status 200 ok" do
      get :index
      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(200)
    end
    
  end
  
end