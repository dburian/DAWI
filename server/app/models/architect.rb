class Architect < ApplicationRecord
  has_many :project_architect_associations, dependent: :destroy, inverse_of: :architect
  has_many :projects, through: :project_architect_associations

  validates :name, presence: true,
                   uniqueness: true, length: { maximum: 50 }

  validate :has_desc_if_leading_arch
  validate :position_exists

  private
    def is_leading_architect?
     logger.debug position_id
     position_id == ArchitectPosition.find_by(name: "Leading Architect").id
    end

    def position_exists
      errors.add(:base, "Architect position does not exists") unless ArchitectPosition.exists?(position_id)
    end

    def has_desc_if_leading_arch
      errors.add(:base, "Leading architects must have a description") if is_leading_architect? && desc.blank?
    end

end
