class Admin::Admin < ApplicationRecord
  validates :email, uniqueness: true,
                  presence: true, length: { maximum: 60 }
  has_secure_password
end
