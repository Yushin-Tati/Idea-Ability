class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sign_out_user, if: :user_signed_in?

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_users_path
      when User
        user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        new_admin_session_path
      when :user
        new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number, :introduction])
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def sign_out_user
    if current_user.is_active == true
      sign_out(current_user)
      flash[:alert] = "このアカウントはBANされました"
      redirect_to new_user_session_path
    end
  end
end
