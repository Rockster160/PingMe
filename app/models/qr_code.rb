# == Schema Information
#
# Table name: qr_codes
#
#  id                  :bigint           not null, primary key
#  code                :string
#  private_description :text
#  private_name        :text
#  public_description  :text
#  public_name         :text
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
class QrCode < ApplicationRecord
  belongs_to :user

  has_many :qr_views
  has_many :conversations

  after_initialize :set_code

  enum status: {
    disabled: 0,
    enabled:  1,
  }, _default: :enabled

  def qr_url
    "https://pingme.site/q/#{code}"
  end

  def qr(opts={})
    @qr ||= RQRCodeCore::QRCode.new(
      opts.delete(:url) || qr_url,
      {
        size: 2,
        level: :l,
        mode: :byte_8bit
      }.merge(opts)
    )
  end

  def to_svg(opts={})
    # Not working for some reason?
    qr(opts).as_svg(
      offset: 0,
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 6,
      standalone: true
    )
  end

  def to_s(opts={})
    qr(opts).to_s.gsub(" ", "\e[104m  \e[0m").gsub("x", "\e[107m  \e[0m")
  end

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
