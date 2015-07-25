class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :short_desc
      t.string :description
      t.string :phone
      t.string :email
      t.string :source_url
      t.string :avatar_url
      t.string :background_url
      t.string :video_url
      t.string :facebook_url
      t.string :wechat_id
      t.string :whatsapp_id

      t.timestamps null: false
    end
  end
end
