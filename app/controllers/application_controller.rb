class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        ## To permit attributes while registration i.e. sign up (app/views/devise/registrations/new.html.erb)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

        ## To permit attributes while editing a registration (app/views/devise/registrations/edit.html.erb)
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin])
    end

    def check_user_admin # Falta mandar alerta de "Acesso Bloqueado!"
        unless user_signed_in? && current_user.admin
            redirect_to :root
        end
    end
end
