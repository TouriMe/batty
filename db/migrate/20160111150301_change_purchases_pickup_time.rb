class ChangePurchasesPickupTime < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :purchases do |t|
        dir.up {t.change :pickup_time, :string }
        dir.down {t.change :pickup_time, :datetime }
      end
    end
  end
end
