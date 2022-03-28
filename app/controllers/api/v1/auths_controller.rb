# module V1
  class Api::V1::AuthsController < ApplicationController
    
    def create
      # define chave JWT
      hmac_secret = '123'
      
      # prepara payload com dados vindos do frontend
      payload = {email: params[:email]}, {password: params[:password]}
      
      # payload = {email: 'admin@admin.com'}, {password: '123'} # descomentando, sempre autentica ;)
      
      # cria token
      token = JWT.encode payload, hmac_secret, 'HS256'
      
      # pesquisa se email vindo do frontend existe no banco de dados
      @user = User.find_by(email: params[:email]) 
      
      # só renderiza token se o usuário estiver cadastrado no banco de dados
      if(@user != nil)
        
        if(@user.email == params[:email] and @user.password == params[:password])
          render json: {categoria: @user.category, token: token}
        else
          render json: {erro: "senha incorreta"}
        end
        
      else
        render json: {erro: "usuário não cadastrado"}
      end
      
    end
    
  end
# end