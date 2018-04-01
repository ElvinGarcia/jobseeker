# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


######
Company.delete_all
Applicant.delete_all
Job.delete_all

@spacex = Company.create(username:"spacex",name:"SpaceX", description:"Make humans multiplanetary", address:"Rocket Road Hawthorne, California", password:"000000")

@spacex.jobs.build(title:"spaceman", date:"17/03/2018",job_type:"fulltime",location:"Hawthorn CA", requirements:"none", salary:1000).save

@solar = Company.create(username:"solar",name:"Solar inc", description:"because it makes sense", address:"444 De Haro Street San Francisco, CA 94107", password:"000000")

@solar.jobs.build(title:"truck driver", date:"17/03/2018",job_type:"fulltime",location:"USA", requirements:"none", salary:1000).save

@abby = Applicant.create(username:"abby", name:"Abby Cadabby", password:"123456")
@elmo = Applicant.create(username:"elmo", name:"Elmo Red Monster", password:"123456")

@elmo.jobs << @spacex.jobs.first
@abby.jobs << @spacex.jobs.first
@abby.jobs << @solar.jobs.first
@elmo.jobs << @solar.jobs.first
