class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  # Localhost liberado sem restrição
  safelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # restringe chamadas dos clientes a 5 chamadas a cada 5 segundos
  throttle('req/ip', limit: 11, period: 5) do |req|
    req.ip
  end
  
  # restringe chamadas na url de login, com mesmo email, a 5 a cada 20 segundos
  # ajustar para rotas da API em questão
  throttle("email", limit: 11, period: 5.seconds) do |req|
    if req.path == '/api/v1/auths' && req.post?
      req.params['email'].presence
    end
  end
 
end