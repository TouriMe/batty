class DriverCertificatesFields < ActiveRecord::Migration
  def change
    add_column :drivers, :english_communication, :boolean
    add_column :drivers, :driving_experience, :string
    add_column :drivers, :basic_history, :boolean
    add_column :drivers, :smartphone_photography, :boolean
    add_column :drivers, :basic_dslr, :boolean
  end
end
