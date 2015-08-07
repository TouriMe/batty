driver ||= @driver

json.id driver.to_param
json.(driver,
    :first_name, :last_name, :nickname, :short_desc, :description, :phone, :email, :source_url,
    :avatar_url, :facebook_url, :video_url, :wechat_id, :whatsapp_id, :updated_at
)
json.cities driver.cities.map(&:name)
json.vehicles driver.vehicles.map(&:name)
json.languages_spoken(
    driver.languages.map(&:language_code).uniq.map {|code| LanguageList::LanguageInfo.find(code).name }
)
json.languages_written(
    driver.languages.select{|l| l.proficiency == 'written'}.map(&:language_code).uniq
        .map {|code| LanguageList::LanguageInfo.find(code).name }
)

# [:first_name, :last_name, :nickname, :short_desc, :description, :phone, :email, :source_url, :avatar_url, :facebook_url, :video_url, :wechat_id, :whatsapp_id, :updated_at].each do |prop|
#   json.__send__(prop, driver.send(prop))
# end

