class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale
  helper_method :current_order, :current_view

  def set_locale
    if cookies[:FnfZettheme_locale] && I18n.available_locales.include?(cookies[:FnfZettheme_locale].to_sym)
      l = cookies[:FnfZettheme_locale].to_sym
    else
      begin
        country_code = request.location.country_code
        if country_code
          country_code = country_code.downcase.to_sym
          [:ru, :ua, :by].include?(country_code) ? l = :uk : l = :en
        else
          l = I18n.default_locale
        end
      rescue
        l = I18n.default_locale
      ensure
        cookies.permanent[:FnfZettheme_locale] = l
      end
    end
    I18n.locale = l
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_view
    @current_view ||= params[:view] || (session[:view].blank? ? nil : session[:view]) || 'grid'
    session[:view] = @current_view
    @current_view
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :name,
      :email,
      :password,
      :encrypted_password,
      :current_password,
      :avatar,
      :avatar_cache_id,
      :remove_avatar
      # :role_ids []
    ) }
  end

  def after_sign_in_path_for(resource)
    dashboards_index_path
  end

end
