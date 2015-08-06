driver ||= @driver

json.id driver.to_param
val = driver.send(:first_name)

[:first_name, :last_name, :nickname, :short_desc, :description, :phone, :email, :source_url, :avatar_url, :facebook_url, :video_url, :wechat_id, :whatsapp_id, :updated_at].each do |prop|
  json.__send__(prop, driver.send(prop))
end
