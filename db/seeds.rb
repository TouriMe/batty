AdminUser.create(email:'admin@cambodiansmile.com', password: '11111111')

['Siem Reap', 'Phnom Penh'].each do |city_name|
  City.create(name: city_name)
end

['Car' , 'Tuk Tuk'].each do |vehicle_name|
  Vehicle.create(name: vehicle_name)
end

language_mapping = {
    'Mandarin' => 'zho',
    'English'  => 'eng',
    'French'   => 'fra',
    'Germany'  => 'deu',
    'Khmer' => 'khm'
}

drivers = JSON.parse(File.open('db/data/drivers.json').read)['drivers']
drivers.each do |driver|
  d = Driver.new driver.except('id', 'cities', 'vehicles', 'languages_spoken', 'languages_written')
  d.save!

  driver['cities'].each do |city_name|
    city = City.find_by(name:city_name)
    d.driver_cities.create!(city: city)
  end

  driver['vehicles'].each do |vehicle_name|
    vehicle_name = 'Car' if vehicle_name == 'Mini Van'
    vehicle = Vehicle.find_by(name:vehicle_name)
    next unless vehicle
    d.driver_vehicles.create!(vehicle: vehicle)
  end

  driver['languages_written'].each do |code|
    d.languages.create! proficiency: 'written', language_code: language_mapping[code]
  end
end

CSV.foreach('db/data/trips.csv') do |r|
  Tour.create!(name: r[1], content: r[2], tuktuk_price_cents: r[3].to_i, tuktuk_price_currency: r[4], image_url: r[7], description: r[8])
end
