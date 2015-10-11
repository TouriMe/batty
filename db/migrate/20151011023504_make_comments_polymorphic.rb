class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    rename_column :comments, :driver_id, :commentable_id
    add_column :comments, :commentable_type, :string
  end
end
