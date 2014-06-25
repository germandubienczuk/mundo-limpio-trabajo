class Supplier < ActiveRecord::Base
#self.site = "http://localhost:3001"
#self.format = :json
validates_presence_of :name

def self.search(search)
  if search
    where("name LIKE '%#{search}%'").all
  else
    all
  end
end


end
