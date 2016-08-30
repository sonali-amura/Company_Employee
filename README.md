op file:

>>Employee.query1

  SQL (0.3ms)  SELECT "employees"."id" AS t0_r0, "employees"."name" AS t0_r1, "employees"."email" AS t0_r2, "employees"."phone" AS t0_r3, "employees"."created_at" AS t0_r4, "employees"."updated_at" AS t0_r5, "employees"."salary" AS t0_r6, "employees"."designation" AS t0_r7, "employees"."company_id" AS t0_r8, "addresses"."id" AS t1_r0, "addresses"."streat" AS t1_r1, "addresses"."city" AS t1_r2, "addresses"."pincode" AS t1_r3, "addresses"."created_at" AS t1_r4, "addresses"."updated_at" AS t1_r5, "addresses"."imageable_id" AS t1_r6, "addresses"."imageable_type" AS t1_r7 FROM "employees" LEFT OUTER JOIN "addresses" ON "addresses"."imageable_id" = "employees"."id" AND "addresses"."imageable_type" = ? WHERE "addresses"."city" = ?  [["imageable_type", "Employee"], ["city", "Pune"]]
=> #<ActiveRecord::Relation [#<Employee id: 2, name: "Mr Kale", email: "xyz@gmail.com", phone: "9132920345", created_at: "2016-08-29 07:08:14", updated_at: "2016-08-29 07:08:14", salary: 37, designation: "Technician", company_id: 1>, #<Employee id: 3, name: "Mr Khyale", email: "abc@gmail.com", phone: "9532920345", created_at: "2016-08-29 07:08:14", updated_at: "2016-08-29 07:08:14", salary: 50, designation: "Module Lead", company_id: 1>, #<Employee id: 4, name: "Mr Bhawalkar", email: "kmln@gmail.com", phone: "9545920345", created_at: "2016-08-29 07:08:14", updated_at: "2016-08-29 07:08:14", salary: 21, designation: "Support", company_id: 1>]>

*********************
>> Employee.query2

   (0.5ms)  SELECT name,email,streat,city,pincode FROM "employees" LEFT OUTER JOIN "addresses" ON "addresses"."imageable_id" = "employees"."id" AND "addresses"."imageable_type" = ? WHERE "employees"."name" = ?  [["imageable_type", "Employee"], ["name", "Mr Bhawalkar"]]
=> [["Mr Bhawalkar", "kmln@gmail.com", "MG road", "Pune", 43278]]
*************************
 Employee.query3
 
  Employee Load (0.4ms)  SELECT name,salary FROM "employees" WHERE (salary>20 AND salary <50)
=> #<ActiveRecord::Relation [#<Employee id: nil, name: "Mr Kale", salary: 37>, #<Employee id: nil, name: "Mr Bhawalkar", salary: 21>, #<Employee id: nil, name: "Mr Barkund", salary: 47>]>
*********************
>> Employee.validate?

   (0.2ms)  begin transaction
  Company Load (0.2ms)  SELECT  "companies".* FROM "companies" WHERE "companies"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
  Employee Exists (0.1ms)  SELECT  1 AS one FROM "employees" WHERE "employees"."email" = ? LIMIT ?  [["email", "xyzgmail.com"], ["LIMIT", 1]]
  Employee Exists (0.1ms)  SELECT  1 AS one FROM "employees" WHERE "employees"."phone" = ? LIMIT ?  [["phone", "980"], ["LIMIT", 1]]
   (0.1ms)  rollback transaction
=> {:phone=>["is the wrong length (should be 10 characters)"], :email=>["is invalid"], :salary=>["must be greater than 0"]}
>> 

