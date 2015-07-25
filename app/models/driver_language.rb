class DriverLanguage < ActiveRecord::Base
  enum proficiency: [:spoken, :written]

  belongs_to :driver

  validates_presence_of :language_code, :proficiency
end
