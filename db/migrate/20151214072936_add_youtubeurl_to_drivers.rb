class AddYoutubeurlToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :youtube_url, :string
  end
end
