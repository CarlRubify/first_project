OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, APP_CONFIG[:app_id], APP_CONFIG[:app_secret],
            {
              :scope => 'email, public_profile',
              :info_fields => 'email,name,first_name,last_name,gender',
              :client_options => {
                                  :ssl => {
                                      :ca_file => "#{Rails.root}/config/ca-bundle.crt"
                                      }
                                  }
                }
end
