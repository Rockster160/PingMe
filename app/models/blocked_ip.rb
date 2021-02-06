# == Schema Information
#
# Table name: blocked_ips
#
#  id              :bigint           not null, primary key
#  ip_address      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  blocked_user_id :bigint
#  user_id         :bigint
#
class BlockedIp < ApplicationRecord
  belongs_to :user
  belongs_to :blocked_user, class_name: "User"
end
