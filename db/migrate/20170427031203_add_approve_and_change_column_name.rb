class AddApproveAndChangeColumnName < ActiveRecord::Migration
  def change
  	add_column :reviews, :approve, :boolean, default: false
  	rename_column :reviews, :type, :review_type
  	change_column :reviews, :star, :integer, default: 0 
  end
end
