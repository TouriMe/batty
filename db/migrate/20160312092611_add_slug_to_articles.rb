class AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string , unique: true
  end
end
