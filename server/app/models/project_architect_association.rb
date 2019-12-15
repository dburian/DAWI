class ProjectArchitectAssociation < ApplicationRecord
  belongs_to :architect
  belongs_to :project
end
