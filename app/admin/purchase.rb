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
end
