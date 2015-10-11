class RenameDriverCommentToComment < ActiveRecord::Migration
  def change
    rename_table :driver_comments, :comments
  end
end
