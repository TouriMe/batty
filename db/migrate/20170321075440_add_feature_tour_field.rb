class AddFeatureTourField < ActiveRecord::Migration
  def change
  	add_column :tours, :feature_tour, :string, default: 'no'
  end
end
