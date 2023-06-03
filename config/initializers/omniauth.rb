# omniauth is not OOTB-compatible with rack_csrf. In order to do so, the following code needs
# to be added to the application bootstrapping code:
OmniAuth::AuthenticityTokenProtection.default_options(key: 'csrf.token', authenticity_param: '_csrf')

OmniAuth.config.logger = Rails.logger
