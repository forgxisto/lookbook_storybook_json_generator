Rails.application.configure do
  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Request-Method' => %w[GET].join(','),
    'X-Frame-Options' => 'DENY'
  }
end
