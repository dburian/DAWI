module API
  module V1
    class Architects < Grape::API
      include API::V1::Defaults      
      
      resource :architects do
        desc "Return all architects"
        get "" do
          Architect.all
        end      
        
      end
    end
  end
end
