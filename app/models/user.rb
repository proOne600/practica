class User < ApplicationRecord
	def proccess
		sleep 10
    	update_attribute(:lastname, Time.zone.now)
	end
end
