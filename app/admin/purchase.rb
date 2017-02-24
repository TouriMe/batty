ActiveAdmin.register Purchase do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :email
      input :price
      input :purchasable_id
      input :status
      input :start_date
      input :contact
      input :phone_number
      input :pickup
      # input :driver_id
      # input :vehicle_id
      input :reference_id
    end


    f.actions
  end
  index do
    selectable_column
    column :price
    column :email
    # column :vehicle_id
    # column :driver_id
    column :purchasable
    column :reference_id
    column :status
    column :start_date
    actions
  end

  show do
    attributes_table do
      row :id
      row :purchasable_id
      row :purchasable_type
      row :price
      row :buyer_id
      row :created_at
      row :updated_at
      row :status
      row :email
      row :start_date
      row :country
      row :contact
      row :driver_id
      row :vehicle_id
      row :comments
      row :email_confirmation
      row :country_code
      row :phone_number
      row :pickup
      row :reference_id
      row :address_id
      row :tour_id
      row :pickup_time
      row :traveller_number
      row :first_name
      row :last_name
      row :passport_number
      row :nationality
      row :vehicle_type
      row 'Location', :latlng do |obj|
        div id:'map', "data-latlng": obj.latlng do
        end
      end
    end
  end
end
