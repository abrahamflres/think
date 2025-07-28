class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.profile.present?
      profile_feeds_path(resource.profile)
    else
      new_profile_path
    end
  end
end
