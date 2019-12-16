class Architect < ApplicationRecord
  has_many :project_architect_associations, dependent: :destroy, inverse_of: :architect
  has_many :projects, through: :project_architect_associations

  validates :name, presence: true,
                   uniqueness: true, length: { maximum: 50 }

  validates :desc, presence: true,
                   if: :is_leading_architect?

  validates :position, presence: true

  private
    def is_leading_architect?
     logger.debug position
     position == 0 #ArchitectPosition.find_by(name: "Leading Architect")
    end

end
