class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :set_search
  
  def set_search
    @q = Plan.ransack(params[:q])
    @plans = @q.result(distinct: true).page(params[:page])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number, :introduction])
  end
  
  private
  
  def search_params
    params.require(:q).permit!
  end
  
end
