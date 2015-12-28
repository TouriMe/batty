ActiveAdmin.register Address do
  
  
  
  
  
  
  controller do
    def permitted_params
      params.permit!
    end
  end
end
