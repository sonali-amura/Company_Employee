class Company < ActiveRecord::Base
	has_many :employees
	has_many :addresses, as: :imageable
end
