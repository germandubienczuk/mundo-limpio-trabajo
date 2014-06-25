class Client < ActiveRecord::Base
	validates_presence_of :name
	validates :cuit, length: { in: 11..13 }
	def self.search(search)
	  if search
	    where("name || lastname || cuit LIKE '%#{search}%'").all
	  else
	    all
	  end
	end

end
