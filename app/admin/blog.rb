ActiveAdmin.register Blog do
  permit_params :title, :content, :author, :publish_date

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :title
      input :content, as: :ckeditor
      input :author
      input :publish_date
    end

    f.actions
  end
end