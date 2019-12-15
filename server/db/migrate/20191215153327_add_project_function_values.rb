class AddProjectFunctionValues < ActiveRecord::Migration[6.0]
  def change
    ProjectFunction.create name: "Public Building"
    ProjectFunction.create name: "Residential Building"
    ProjectFunction.create name: "Administration Building"
    ProjectFunction.create name: "Urbanism"
  end
end
