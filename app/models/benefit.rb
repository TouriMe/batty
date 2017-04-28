class Benefit < ActiveRecord::Base
	mount_uploader :image, BenefitUploader
end
