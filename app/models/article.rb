class Article < ActiveRecord::Base
	belongs_to :category
	validates_uniqueness_of :description
  	validates_presence_of :description
	validates :price, :numericality => {:greater_than => 0, :less_than => 2000}
	validates :price_cost, :numericality => {:greater_than => 0, :less_than => 2000}
	validates :price_card, :numericality => {:greater_than => 0, :less_than => 2000}
	def self.search(search)
	  if search
	    where("description || bar_code LIKE '%#{search}%'").all
	  else
	    all
	  end
	end
end
