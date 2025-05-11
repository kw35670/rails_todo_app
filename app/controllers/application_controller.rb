class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_user_teams

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :password, :password_confirmation, :current_password])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def current_user_teams
    return [] unless user_signed_in?
    @current_user_teams ||= begin
      teams = current_user.teams
      Rails.logger.debug "Current user teams: #{teams.inspect}"
      teams
    end
  end
end
