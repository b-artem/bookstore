class ApplicationController < ActionController::Base
  include CurrentCart
  protect_from_forgery with: :exception
  before_action :set_locale_from_params
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cart

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def set_locale_from_params
    return unless params[:locale]
    if I18n.available_locales.map(&:to_s).include?(params[:locale])
      I18n.locale = params[:locale]
    else
      flash.now[:notice] = "#{params[:locale]} translation not available"
      logger.error flash.now[:notice]
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end
end
