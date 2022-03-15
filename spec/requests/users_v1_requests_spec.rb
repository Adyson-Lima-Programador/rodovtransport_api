require 'rails_helper'

RSpec.describe "UsersV1Requests", type: :request do
  
  before {
    @req = ActionDispatch::Request.new 'HTTP_HOST' => 'v1.localhost'
    puts("#{@req.subdomain}")
  }
  
  
  describe "GET /users" do
      
      it "works! (now write some real specs)" do
        # get users_path
        # expect(response).to have_http_status(200)
      end
      
    end
  
end
