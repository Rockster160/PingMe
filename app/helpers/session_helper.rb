module SessionHelper
  def current_user
    @_current_user ||= begin
      if request.headers["HTTP_AUTHORIZATION"].present?
        auth_from_headers
      else
        auth_from_session
      end
    end
  end

  def create_guest_user
    user = User.create(role: :guest)

    sign_in user
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_out
    session[:forwarding_url] = nil
    session[:current_user_id] = nil
    cookies.signed[:current_user_id] = nil
    cookies.signed.permanent[:current_user_id] = nil
    @_current_user = nil
  end

  def sign_in(user)
    sign_out
    session[:current_user_id] = user.id
    cookies.signed[:current_user_id] = user.id
    current_user
  end

  def auth_from_headers
    # basic_auth_string = Base64.decode64(request.headers["HTTP_AUTHORIZATION"][6..-1]) # Strip "Basic " from hash
    # User.auth_from_basic(basic_auth_string)
  end

  def auth_from_session
    current_user_id = session[:current_user_id].presence || cookies.signed[:current_user_id].presence || cookies.signed.permanent[:current_user_id]

    if current_user_id.present?
      session[:current_user_id] = current_user_id
      cookies.signed[:current_user_id] = current_user_id
      cookies.signed.permanent[:current_user_id] = current_user_id
      user = User.find_by_id(current_user_id)
      sign_out if user.nil?
      user
    end
  end
end
