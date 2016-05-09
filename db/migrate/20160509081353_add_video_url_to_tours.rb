class AddVideoUrlToTours < ActiveRecord::Migration
  def change
    add_column :tours, :video_url, :string
  end
end
