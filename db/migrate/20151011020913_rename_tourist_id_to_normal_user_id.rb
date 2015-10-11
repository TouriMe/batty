class RenameTouristIdToNormalUserId < ActiveRecord::Migration
  def change
    rename_column :driver_comments, :tourist_id, :normal_user_id
  end
end
