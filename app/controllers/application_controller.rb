class ApplicationController < ActionController::Base
  # setting app language
  before_action :set_i18n_locale_from_params

  protect_from_forgery with: :exception

  protected
    # certifying user's login
    def authorize
      unless Usuario.find_by(id: session[:usuario_id])
        redirect_to login_url, notice: "Por favor, efetue o login"
      end
    end

    # method that returns locale language
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
end
