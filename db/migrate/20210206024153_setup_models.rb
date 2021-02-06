class SetupModels < ActiveRecord::Migration[6.1]
  def change
    create_table  :users do |t|
      t.integer :sign_in_count, null: false, default: 0

      t.timestamps
    end

    create_table :credentials do |t|
      t.belongs_to :user
      t.string :cookie_token
      t.string :email
      t.string :otp_token
      t.string :phone

      t.timestamps
    end

    create_table :credential_histories do |t|
      t.string :ip
      t.string :user_agent
      t.belongs_to :credential
      t.belongs_to :user

      t.timestamps
    end

    create_table :qr_codes do |t|
      t.string :code
      t.text :private_description
      t.text :private_name
      t.text :public_description
      t.text :public_name
      t.integer :status
      t.belongs_to :user

      t.timestamps
    end 

    create_table :qr_views do |t|
      t.string :ip_address
      t.text :user_agent
      t.belongs_to :qr_code
      t.belongs_to :user

      t.timestamps
    end

    # create_table :preferences do |t|
    #   t.belongs_to :user
    #   # t.string :cookie_token
    #
    #   t.timestamps
    # end

    create_table :conversations do |t|
      t.belongs_to :guest_user
      t.belongs_to :qr_code
      t.belongs_to :qr_user
      t.string :code

      t.timestamps
    end

    create_table :messages do |t|
      t.text :body
      t.datetime :read_at
      t.belongs_to :author
      t.belongs_to :conversation

      t.timestamps
    end

    create_table :blocked_ips do |t|
      t.belongs_to :user
      t.belongs_to :blocked_user
      t.string :ip_address

      t.timestamps
    end
  end
end
