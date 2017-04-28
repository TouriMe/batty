class Review < ActiveRecord::Base
	validates_presence_of :review

	def self.sort_by_date
		where(approve: true).order("created_at desc")
	end

	def self.sort_by_star
		where(approve: true).order("star desc")
	end
end
