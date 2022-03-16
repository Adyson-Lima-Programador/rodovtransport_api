require 'rails_helper'

RSpec.describe V1::AuthsController, type: :controller do
  
  describe "POST /auths" do
    
    it "Consegue acessar auths JWT -> status 200 ok" do
      post :create, params: { email: 'a@a.com', password: '123456' }
      expect(response.body).to include_json(
        token: "eyJhbGciOiJIUzI1NiJ9.W3siZW1haWwiOiJhQGEuY29tIn0seyJw"+
        "YXNzd29yZCI6IjEyMzQ1NiJ9XQ.TWTbhy130QuJUVRrZ8VMk6GE0j3wwea_CEH3881ui-w")
    end
    
  end
  
end