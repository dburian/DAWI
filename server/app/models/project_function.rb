class ProjectFunction < ApplicationRecord
  has_many :projects

  validates :name, presence: true,
                    uniqueness: true,
                    length: { maximum: 50 }
end
