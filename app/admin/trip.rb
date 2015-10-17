ActiveAdmin.register Trip do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :name
      input :price
      input :price_currency, as: :string
      input :content, as: :html_editor
    end
    f. actions
  end

  index do
    selectable_column
    column :name
    column(:price){|c| c.price.to_s + ' ' + c.price.currency}
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row(:price){"#{trip.price} #{trip.price_currency}"}
      row :content
    end
    active_admin_comments
  end
end
