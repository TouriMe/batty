class AddTypeToReivew < ActiveRecord::Migration
  def change
  	add_column :reviews, :type, :string
  end
end
