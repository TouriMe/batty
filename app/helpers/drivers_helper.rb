module DriversHelper
  # for reservation
  def get_all_vehicles(driver)
    driver.vehicles.pluck(:name).to_sentence
  end

  def get_first_vehicle(driver)
    if driver.vehicles.count > 0
      driver.vehicles.first.name
    end
  end
  #------------

  def driver_skills(driver)
    skills = []
    if driver.driving_experience
      skills << driver.driving_experience + ' Year of Driving Experience'
    end
    if driver.english_communication
      skills << 'English Communication'
    end
    if driver.basic_history
      skills << 'Basic History'
    end
    if driver.smartphone_photography
      skills << 'Smartphone Photography'
    end
    if driver.basic_dslr
      skills << 'Basic DSLR'
    end
    skills.to_sentence
  end
end
