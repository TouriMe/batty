ActiveAdmin.register TourType do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :name
    end

    f.actions

  end

end
