class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email_address, uniqueness: true
  validates :password, :confirmation => true
  validates :password_confirmation, presence: true, if: :password_digest_changed?
end
