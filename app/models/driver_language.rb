class DriverLanguage < ActiveRecord::Base
  enum proficiency: [:spoken, :written]
end
