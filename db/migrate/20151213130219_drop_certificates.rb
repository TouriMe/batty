class DropCertificates < ActiveRecord::Migration
  def down
    drop_table :certificates
    drop_table :certificates_drivers
  end
end
