class ApplicationController < ActionController::Base
    include Pundit::Authorization

    # Adding extra fields for signup page
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    # Display error message if user is unauthorized to do an actoin
    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    def forbidden
        flash[:alert] = "You are not authorized to perform that action!"
        redirect_to root_path
    end

    def record_not_found
        flash[:alert] = "That session doesnt exist"
        redirect_to root_path
    end
end
