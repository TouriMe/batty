ActiveAdmin.register NormalUser do
  permit_params :email, :password, :password_confirmation

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
    end
    f.actions
  end
end