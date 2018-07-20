OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '773154134313-fin2msrdo802um5tb0uah724re50b93o.apps.googleusercontent.com', 'B0e4GtJo0XznHjRTCPqa66US', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
