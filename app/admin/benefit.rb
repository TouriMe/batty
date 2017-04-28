ActiveAdmin.register Benefit do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :title
      input :description
      input :image, label: 'Image(sieze: 80x80)'
    end
    
    f.actions
  end

end
