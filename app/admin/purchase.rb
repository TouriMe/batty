ActiveAdmin.register Purchase do
  
  index do
    selectable_column
    column :price
    column :email
    column :vehicle_id
    column :driver_id   
    column :purchasable_id
    column :reference_id
    column :status
    column :start_date
    actions
  end
end
