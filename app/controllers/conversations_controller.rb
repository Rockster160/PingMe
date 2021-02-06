class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = current_user.viewable_conversations.find_by!(code: params[:code])

    @messages = @conversation.messages.order(:created_at)
  end
end
