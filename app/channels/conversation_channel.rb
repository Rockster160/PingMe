class ConversationChannel < ApplicationCable::Channel
  def subscribed
    conversation = current_user.viewable_conversations.find_by!(code: params[:code])

    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    conversation = current_user.viewable_conversations.find_by!(code: params[:code])

    message = conversation.messages.create(author: current_user, body: data["body"])

    html = MessagesController.render(partial: "show", locals: { message: message })
    sleep 3
    ConversationChannel.broadcast_to conversation, { html: html }
  end
end
