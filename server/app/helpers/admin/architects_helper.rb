module Admin::ArchitectsHelper
  def position_name architect=@architect
    return "" if architect.nil?
    Admin::ArchitectPosition.find(architect.position_id).name
  end
end
