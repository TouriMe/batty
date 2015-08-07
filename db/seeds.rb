AdminUser.create(email:'admin@cambodiansmile.com', password: '11111111')

['Siem Reap', 'Phnom Penh'].each do |city_name|
  City.create(name: city_name)
end

['Mini Bus' , 'Mini Van', 'Tuk Tuk'].each do |vehicle_name|
  Vehicle.create(name: vehicle_name)
end

drivers = JSON.parse(File.open('db/data/drivers.json').read)['drivers']
drivers.each do |driver|
  d = Driver.new driver.except('id', 'cities', 'vehicles', 'languages_spoken', 'languages_written')
  d.save!

  driver['cities'].each do |city_name|
    city = City.find_by(name:city_name)
    d.driver_cities.create(city: city)
  end

  driver['vehicles'].each do |vehicle_name|
    vehicle = Vehicle.find_by(name:vehicle_name)
    d.driver_vehicles.create(vehicle: vehicle)
  end
end
