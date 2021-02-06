module SessionHelper
  def current_user
    @_current_user ||= begin
    end
  end

  def user_signed_in?
    current_user.present?
  end
end
