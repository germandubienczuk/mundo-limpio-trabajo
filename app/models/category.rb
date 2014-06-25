class Category < ActiveRecord::Base
	has_many :articles

	def self.search(search)
	  if search
	    where("name LIKE '%#{search}%'").all
	  else
	    all
	  end
	end

end
