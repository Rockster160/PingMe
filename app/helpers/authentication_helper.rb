module AuthenticationHelper
  def authenticate_user!
    return if user_signed_in?

    head 401
  end
end
