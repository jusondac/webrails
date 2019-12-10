class Comment < ActiveRecord::Base
	before_create :default_status
	belongs_to :article

	def default_status
		self.status = "not active"
		self.user_id = 1
	end

end