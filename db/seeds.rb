# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create(name:"Mr Godage",email:"svaibhavrv09@gmail.com",phone:9545920263,salary:55,designation:"Soft Engg",company_id:1)
Employee.create(name:"Mr Kale",email:"xyz@gmail.com",phone:9132920345,salary:37,designation:"Technician",company_id:1)
Employee.create(name:"Mr Khyale",email:"abc@gmail.com",phone:9532920345,salary:50,designation:"Module Lead",company_id:1)
Employee.create(name:"Mr Bhawalkar",email:"kmln@gmail.com",phone:9545920345,salary:21,designation:"Support",company_id:1)
Employee.create(name:"Mr Barkund",email:"sg@gmail.com",phone:9545920245,salary:47,designation:"Soft Developer",company_id:2)

Company.create(name:"Amura Tech")
Company.create(name:"HCL")

e.addresses.create(:city=>"Mumbai",:streat=>"MP road")
e.addresses.create(:city=>"Pune",:streat=>"MP road",pincode:43214)
e.addresses.create(:city=>"Pune",:streat=>"ML road",pincode:43290)
e.addresses.create(:city=>"Pune",:streat=>"MG road",pincode:43278)
e.addresses.create(:city=>"Solapur",:streat=>"MG road",pincode:43208)
