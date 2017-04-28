class AddFieldToBenefit < ActiveRecord::Migration
  def change
  	add_column :benefits, :title, :string
  end
end
