module Admin::ProjectsHelper
  def function_name project=@project
    return "" if project.nil?
    ProjectFunction.find(project.function_id).name
  end
  def status_name project=@project
    return "" if project.nil?
    ProjectStatus.find(project.status_id).name
  end
  def architect_names project=@project
    return "" if project.nil?
    Architect.find(project.architect_ids).map{ |arch| arch.name }.join(", ")
  end
end

