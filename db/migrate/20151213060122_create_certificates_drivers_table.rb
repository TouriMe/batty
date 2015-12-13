class CreateCertificatesDriversTable < ActiveRecord::Migration
  def change
    create_table :certificates_drivers, id: false do |t|
      t.belongs_to :certificate, index: true
      t.belongs_to :driver, index: true
    end
  end
end
