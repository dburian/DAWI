class Admin::ProjectArchitectAssociation < ApplicationRecord
  belongs_to :architect, inverse_of: :project_architect_associations
  belongs_to :project, inverse_of: :project_architect_associations

  validates :architect, presence: true
  validates :project, presence: true, uniqueness: { scope: :architect, message: "Architect should be assigned to project only once" }
end
