class Employee < ActiveRecord::Base
	belongs_to :company
	has_many :addresses, as: :imageable
	validates :email ,:phone ,uniqueness: true
	validates :phone,numericality: { only_integer: true }, length: {is: 10},allow_blank: true
	validates :email , presence:true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_format_of :name,:with => /\A[A-Za-z ]+\Z/
	validates_numericality_of :salary,:greater_than=> 0
	
	def self.query1
		@emp=Employee.includes(:addresses).where(:addresses=>{city:"Pune"}).all
 	end
 	def self.query2
  		Employee.includes(:addresses).where(:name=>"Mr Bhawalkar").pluck("name,email,streat,city,pincode")
	end
 	def self.query3
 		Employee.select("name,salary").where("salary>? AND salary <?",20,50)
 	end
 	def self.validate?
 		e=Employee.create(name:"Sonali",email:"xyzgmail.com",phone:980,salary:0,designation:"tech",company_id:2)
		e.errors.messages
 	end
end
