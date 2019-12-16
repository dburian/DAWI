class Project < ApplicationRecord
  has_many :project_architect_associations, dependent: :destroy, inverse_of: :project
  has_many :architects, through: :project_architect_associations

  validates :name, presence: true,
                   length: { maximum: 40 }

  validates :long_desc, presence: true,
                        length: { maximum: 1024 }

  validates :short_desc, presence: true,
                         length: { maximum: 512 }

  validates :year, presence: true,
                   numericality: { only_integer: true,
                                   greater_than: 2009,
                                   less_than: 2100
                                 }
  validate :has_some_architect

  private
    def has_some_architect
      errors.add(:base, "Project must have at least one architect") if architect_ids.length == 0
    end
end
