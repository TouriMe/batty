class RemoveTripCommentTable < ActiveRecord::Migration
  def change
    drop_table :trip_comments
  end
end
