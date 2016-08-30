
**********************************
1:All employees in Pune(or any other city)

Query:
 @emp=Employee.includes(:addresses).where(:addresses=>{city:"Pune"}).all
 						OR
 @emp=Employee.joins(:addresses).where(:addresses=>{city:"Pune"}).all

 ANS:
  SQL (0.3ms)  SELECT "employees"."id" AS t0_r0, "employees"."name" AS t0_r1, "employees"."email" AS t0_r2, "employees"."phone" AS t0_r3, "employees"."created_at" AS t0_r4, "employees"."updated_at" AS t0_r5, "employees"."salary" AS t0_r6, "employees"."designation" AS t0_r7, "employees"."company_id" AS t0_r8, "addresses"."id" AS t1_r0, "addresses"."streat" AS t1_r1, "addresses"."city" AS t1_r2, "addresses"."pincode" AS t1_r3, "addresses"."created_at" AS t1_r4, "addresses"."updated_at" AS t1_r5, "addresses"."imageable_id" AS t1_r6, "addresses"."imageable_type" AS t1_r7 FROM "employees" LEFT OUTER JOIN "addresses" ON "addresses"."imageable_id" = "employees"."id" AND "addresses"."imageable_type" = ? WHERE "addresses"."city" = ?  [["imageable_type", "Employee"], ["city", "Pune"]]
=> #<ActiveRecord::Relation [#<Employee id: 2, name: "Mr Barkund", email: "sg@gmail.com", phone: "9545920245", created_at: "2016-08-29 04:58:08", updated_at: "2016-08-29 04:58:08", salary: 47, designation: "Soft Developer", company_id: 2>, #<Employee id: 3, name: "Mr Bhawalkar", email: "kmln@gmail.com", phone: "9545920345", created_at: "2016-08-29 04:59:04", updated_at: "2016-08-29 04:59:04", salary: 21, designation: "Support", company_id: 1>, #<Employee id: 4, name: "Mr Khyale", email: "abc@gmail.com", phone: "9532920345", created_at: "2016-08-29 04:59:46", updated_at: "2016-08-29 04:59:46", salary: 50, designation: "Module Lead", company_id: 1>, #<Employee id: 5, name: "Mr Kale", email: "xyz@gmail.com", phone: "9132920345", created_at: "2016-08-29 05:00:24", updated_at: "2016-08-29 05:00:24", salary: 37, designation: "Technician", company_id: 1>]>

**************************************************************************
2. . Search any employee via name and/or email should return the name email and his/her address
 >> Employee.includes(:addresses).where(:name=>"Mr Bhawalkar").pluck("name,email,streat,city,pincode")
   (0.5ms)  SELECT name,email,streat,city,pincode FROM "employees" LEFT OUTER JOIN "addresses" ON "addresses"."imageable_id" = "employees"."id" AND "addresses"."imageable_type" = ? WHERE "employees"."name" = ?  [["imageable_type", "Employee"], ["nilame", "Mr Bhawalkar"]]
=> 

[["Mr Bhawalkar", "kmln@gmail.com", "MG road", "Pune", 43278]]


**************************************************************************
3:Employee earning between 20k 50k
 >>Employee.select("name,salary").where("salary>? AND salary <?",20,50)
  Employee Load (0.4ms)  SELECT name,salary FROM "employees" WHERE (salary>20 AND salary <50)
=> #<ActiveRecord::Relation [#<Employee id: nil, name: "Mr Kale", salary: 37>, #<Employee id: nil, name: "Mr Bhawalkar", salary: 21>, #<Employee id: nil, name: "Mr Barkund", salary: 47>]>



**************************************************************************
Validations:::
>>e=Employee.create(name:"Sonali",email:"xyzgmail.com",phone:980,salary:0,designation:"tech",company_id:2)
	   (0.1ms)  begin transaction
	  Company Load (0.1ms)  SELECT  "companies".* FROM "companies" WHERE "companies"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
	  Employee Exists (0.1ms)  SELECT  1 AS one FROM "employees" WHERE "employees"."email" = ? LIMIT ?  [["email", "xyzgmail.com"], ["LIMIT", 1]]
	  Employee Exists (0.2ms)  SELECT  1 AS one FROM "employees" WHERE "employees"."phone" = ? LIMIT ?  [["phone", "980"], ["LIMIT", 1]]
	   (0.1ms)  rollback transaction

	  #<Employee id: nil, name: "Ms Sonali", email: "xyzgmail.com", phone: "980", created_at: nil, updated_at: nil, salary: 0, designation: "tech", company_id: 2>
>> e.errors.messages
=> {:phone=>["is the wrong length (should be 10 characters)"], :email=>["is invalid"], :salary=>["must be greater than 0"]}
