ActiveAdmin.register NormalUser do

  index do
    selectable_column
    column :email
    column :name
    column :provider
    column :sign_in_count
    column :created_at
    column :updated_at
    column :internal_user, label: 'Is his User an TouriMe internal User?'
    actions
  end

  permit_params :email, :password, :password_confirmation,:internal_user

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :internal_user, label: 'Mark this user as an TouriMe internal user'
    end
    f.actions
  end
end