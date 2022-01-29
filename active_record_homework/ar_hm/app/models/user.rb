class User < ApplicationRecord
  has_one :shop
  validates :email, format: { with: /\A\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+\z/ }
  validates :phone_number, format: { with: /\A\+380(93||63)\d{7}\z/ }
end
