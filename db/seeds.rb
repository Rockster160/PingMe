user = User.create
# cred = user.credentials.create
qr = user.qr_codes.create
puts "QR: #{qr.qr_url}"
