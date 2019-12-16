class Admin::ProjectFunction < ApplicationRecord
  validates :name, presence: true,
                    uniqueness: true,
                    length: { maximum: 50 }
end
