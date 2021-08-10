# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError do
    redirect_to campaigns_path, alert: "You are not allowed to create."
  end

  devise_group :user, contains: %i[expert novice]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    campaigns_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username profession service])
    devise_parameter_sanitizer.permit(:user_update, keys: %i[username profession service])
  end
end
