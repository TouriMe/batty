class AddIsHeroToImages < ActiveRecord::Migration
  def change
    add_column :images, :is_hero, :boolean, default: false
  end
end
