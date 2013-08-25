class Book < ActiveRecord::Base
	validates_presence_of :title, :author, :year, :rating
	validates :rating, numericality: {only_integer: true}
	validates :year, numericality: {only_integer: true}
end
