# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  sign_in_count :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
  has_many :qr_codes
  has_many :qr_views
  has_many :blocked_ips
  has_many :owned_conversations, foreign_key: :qr_user_id
  has_many :started_conversations, foreign_key: :guest_user_id
  has_many :messages, foreign_key: :author_id

  def viewable_conversations
    return Conversation.none if id.blank?

    Conversation.where("qr_user_id = ? OR guest_user_id = ?", id, id)
  end

  def guest?
  end
end
