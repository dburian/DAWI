module ArchitectsHelper
  def position_name architect=@architect
    return "" if architect.nil?
    ArchitectPosition.find(architect.position_id).name
  end
end
