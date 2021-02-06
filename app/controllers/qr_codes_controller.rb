class QrCodesController < ApplicationController
  def show
    @qr = QrCode.find_by(code: params[:code])

    @guest = current_guest_user
    create_qr_view

    conversation = create_conversation

    redirect_to conversation
  end

  private

  def current_guest_user
    return current_user if user_signed_in?

    create_guest_user
  end

  def create_qr_view
    @guest.qr_views.create(
      user_agent: request.user_agent,
      ip_address: request.remote_ip,
      qr_code: @qr
    )
  end

  def create_conversation
    Conversation.find_or_create_by(
      qr_user_id: @qr.user_id,
      guest_user_id: @guest.id,
      qr_code: @qr
    )
  end

  def create_guest_user
    guest = User.create

    sign_in guest
  end
end
