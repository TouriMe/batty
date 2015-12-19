class ChangeStartEndTypeToTrips < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :trips do |t|
        t.change :tour_start, :string
        t.change :tour_end, :string
      end
    end
  end
end
