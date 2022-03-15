class ApplicationController < ActionController::API
  
  # Configuração para login JWT
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
end
