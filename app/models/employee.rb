class Employee < ActiveRecord::Base
	belongs_to :company
	has_many :addresses, as: :imageable
	validates :email ,:phone ,uniqueness: true
	validates :phone,numericality: { only_integer: true }, length: {is: 10},allow_blank: true
	validates :email , presence:true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_format_of :name,:with => /\A[A-Za-z ]+\Z/
	validates_numericality_of :salary,:greater_than=> 0
end
