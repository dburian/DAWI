class Project < ApplicationRecord
  has_many :project_architect_associations, dependent: :destroy, inverse_of: :project
  has_many :architects, through: :project_architect_associations
  has_many_attached :images

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
  validate :function_exists
  validate :status_exists

  private
    def has_some_architect
      errors.add(:base, "Project must have at least one architect") if architect_ids.length == 0
    end
    def function_exists
      errors.add(:base, "Provided project function does not exists") unless ProjectFunction.exists?(function_id)
    end
    def status_exists
      errors.add(:base, "Provided project status does not exists") unless ProjectStatus.exists?(status_id)
    end

end
