module API
  module V1
    class Projects < Grape::API
      include API::V1::Defaults      
      
      resource :projects do
        desc "Return all projects"
        get "" do
          Project.all
        end
        
      desc "Return a project"
        params do
          requires :id, type: Integer, desc: "ID of the project"
        end
        get ":id" do
          Project.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
