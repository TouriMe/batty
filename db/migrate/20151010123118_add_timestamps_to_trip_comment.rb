class AddTimestampsToTripComment < ActiveRecord::Migration
  def change
    add_column(:trip_comments, :created_at, :datetime)
    add_column(:trip_comments, :updated_at, :datetime)

  end
end