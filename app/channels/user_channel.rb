class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    conversation = current_user.viewable_conversations.find_by!(code: data["code"])
    message = conversation.messages.create(author: current_user, body: data["body"])

    [conversation.qr_user, conversation.guest_user].each do |participant|
      html = MessagesController.render(partial: "show", locals: { message: message, current_user: participant })

      UserChannel.broadcast_to participant, { html: html }
    end
  end
end
