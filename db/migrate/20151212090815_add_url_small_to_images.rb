class AddUrlSmallToImages < ActiveRecord::Migration
  def change
    add_column :images, :url_small, :string
  end
end
