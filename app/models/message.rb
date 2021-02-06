# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint
#  conversation_id :bigint
#
class Message < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :conversation
end
