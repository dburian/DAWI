class ProjectFunction < ApplicationRecord
  has_many :projects

  validates :name, presence: true,
                    length: { maximum: 50 }
end
