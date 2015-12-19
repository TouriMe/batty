class AddHighlightIncludeExclueToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :highlight_html, :string
    add_column :trips, :include_html, :string
    add_column :trips, :exclude_html, :string
    add_column :trips, :tour_start, :date
    add_column :trips, :tour_end, :date
  end
end
