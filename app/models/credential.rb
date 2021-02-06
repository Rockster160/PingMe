# == Schema Information
#
# Table name: credentials
#
#  id           :bigint           not null, primary key
#  cookie_token :string
#  email        :string
#  otp_token    :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
class Credential < ApplicationRecord
  # Cookie token - cross match a matching cookie session
end
