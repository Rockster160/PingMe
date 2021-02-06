# == Schema Information
#
# Table name: credential_histories
#
#  id            :bigint           not null, primary key
#  ip            :string
#  user_agent    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :bigint
#  user_id       :bigint
#
class CredentialHistory < ApplicationRecord
end
