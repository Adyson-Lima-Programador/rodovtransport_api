module V1
  class AuthsController < ApplicationController
    
    def create
      hmac_secret = '123'
      payload = {email: params[:email]}, {password: params[:password]}
      # payload = {email: 'a@a.com'}, {password: '123456'} # descomentando, sempre autentica ;)
      token = JWT.encode payload, hmac_secret, 'HS256'
      render json: {token: token}
    end
    
  end
end