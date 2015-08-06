AdminUser.create(email:'admin@cambodiansmile.com', password: '11111111')

['Siem Reap', 'Phnom Penh'].each do |city_name|
  City.create(name: city_name)
end

['Mini Bus' , 'Mini Van', 'Tuk Tuk'].each do |vehicle_name|
  Vehicle.create(name: vehicle_name)
end
