class AddPageIntoSeo < ActiveRecord::Migration
  def change
    add_column :seos, :page, :string
  end
end
