class Comment < ApplicationRecord
	before_create :default_status
	belongs_to :article

	def default_status
		self.status = "active"
		self.user_id = 1
	end
end
