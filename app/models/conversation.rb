# == Schema Information
#
# Table name: conversations
#
#  id            :bigint           not null, primary key
#  code          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  guest_user_id :bigint
#  qr_code_id    :bigint
#  qr_user_id    :bigint
#
class Conversation < ApplicationRecord
  belongs_to :qr_code
  belongs_to :qr_user, class_name: "User"
  belongs_to :guest_user, class_name: "User"

  after_initialize :set_code

  has_many :messages

  def to_param
    code
  end

  private

  def set_code
    self.code ||= loop do
      token = SecureRandom.alphanumeric(10).downcase

      break token if self.class.where(code: token).where.not(id: id).none?
    end
  end
end
