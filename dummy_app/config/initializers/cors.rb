Rails.application.configure do
  unless Rails.env.production?
    # CORS
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w[GET].join(','),
      'X-Frame-Options' => 'ALLOWALL'
    }
  end
end
