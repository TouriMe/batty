class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
