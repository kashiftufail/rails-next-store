Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000' # or the URL of your React app
  
      resource '*',
        headers: :any,
        expose: ['access-token', 'client', 'expiry', 'uid', 'bearer'], # Add the headers to expose
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
end  