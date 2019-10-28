class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  private

    def set_locale
      if params[:locale].present?
        I18n.locale = params[:locale]
      elsif session[:locale].present?
        I18n.locale = session[:locale]
      end

      session[:locale] = I18n.locale
    end
end
