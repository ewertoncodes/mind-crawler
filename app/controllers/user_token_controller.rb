class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
  rescue_from Mongoid::Errors::DocumentNotFound, :with => :not_found
end
