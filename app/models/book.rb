class Book < ActiveRecord::Base
	validates_presence_of :title, :author, :year, :rating, :description
	validates :rating, numericality: {only_integer: true}
	validates :year, numericality: {only_integer: true}

	def self.search_for(query)
		where('title LIKE :query OR author LIKE :query OR year LIKE :query', query: "%#{query}%")
	end
end
