# == Schema Information
#
# Table name: qr_views
#
#  id         :bigint           not null, primary key
#  ip_address :string
#  user_agent :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  qr_code_id :bigint
#  user_id    :bigint
#
class QrView < ApplicationRecord
  belongs_to :user
  belongs_to :qr_code
end
