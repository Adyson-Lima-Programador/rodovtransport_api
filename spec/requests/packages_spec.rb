require 'rails_helper'

RSpec.describe "Packages", type: :request do
  
  before { @packages = create_list(:user, 3) }
  
  describe "GET /packages" do
    
    it "Consegue listar todos os pacotes -> status 200 ok)" do
      get packages_path
      expect(JSON.parse(response.body).size).to eq(3) # Verifica tamanho da resposta
      expect(response).to have_http_status(200)
    end
    
  end
  
  
  
end
