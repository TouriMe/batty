ActiveAdmin.register Length do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :length_title
    end

    f.actions

  end

end
