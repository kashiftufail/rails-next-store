class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  skip_forgery_protection
  # include DeviseTokenAuth::Concerns::SetUserByToken
end
