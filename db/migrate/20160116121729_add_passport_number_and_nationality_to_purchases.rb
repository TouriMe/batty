class AddPassportNumberAndNationalityToPurchases < ActiveRecord::Migration
  def change
    add_column Purchase, :passport_number, :string
    add_column Purchase, :nationality, :string
  end
end
