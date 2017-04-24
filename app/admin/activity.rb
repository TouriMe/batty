ActiveAdmin.register Activity do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :activity_name
    end
    
    f.actions
  end

end
