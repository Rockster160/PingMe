class ApplicationController < ActionController::Base
  include SessionHelper
  include AuthenticationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # helper_method :current_user, :user_signed_in?, :guest_account?
  # before_action :see_current_user, :logit
  #
  # def flash_message
  #   flash.now[params[:flash_type].to_sym] = params[:message]
  #   render partial: 'layouts/flashes'
  # end
  #
  private
  #
  # def guest_account?
  #   current_user&.guest?
  # end
  #
  # def show_guest_banner
  #   @show_guest_banner = true
  # end
  #
  # def see_current_user
  #   Rails.logger.silence do
  #     if user_signed_in?
  #       current_user.see!
  #       request.env['exception_notifier.exception_data'] = { current_user: current_user }
  #     end
  #   end
  # end
  #
  # def logit
  #   return CustomLogger.log_blip! if params[:checker]
  #
  #   CustomLogger.log_request(request, current_user)
  # end
  #
  # def unauthorize_user
  #   if current_user.present?
  #     redirect_to lists_path
  #   end
  # end
  #
  # def previous_url(fallback=nil)
  #   session[:forwarding_url] || fallback || lists_path
  # end
  #
  # def authorize_user
  #   unless current_user.present?
  #     create_guest_user
  #
  #     flash.now[:notice] = "We've signed you up with a guest account!"
  #   end
  # end
  #
  # def authorize_admin
  #   unless current_user.try(:admin?)
  #     session[:forwarding_url] = request.original_url if request.get?
  #     redirect_to login_path
  #   end
  # end
end
