ActiveAdmin.register Article do
  permit_params :title, :content

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :title
      input :content, as: :ckeditor
    end

    f.actions
  end
end