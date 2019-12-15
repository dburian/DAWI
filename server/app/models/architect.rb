class Architect < ApplicationRecord
  has_many :projects, through: :project_architect_associations

  validates :name, presence: true,
                   uniqueness: true, length: { maximum: 50 }

  POSITION_OPTIONS = %w(project_architect leading_architect)
  validates :position, presence: true,
                       inclusion: { in: POSITION_OPTIONS,
                                    message: "%{value} must be one of #{POSITION_OPTIONS}"
                                  }
    
  validates :desc, presence: true,
                   if: :is_leading_architect?

  def is_leading_architect?
   logger.debug position
   position == "leading_architect"
  end
end
