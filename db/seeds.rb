# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


######

@spacex = Company.create(username:"spacex",name:"SpaceX", description:"Make humans multiplanetary", address:"Rocket Road Hawthorne, California", password:"000")


@solar = Company.create(username:"solar",name:"Solar inc", description:"because it makes sense", address:"444 De Haro Street San Francisco, CA 94107", password:"000")


@spacex.jobs.build(title:"spaceman", date:"17/03/2018",job_type:"fulltime",location:"Hawthorn CA", requirements:"none", salary:1000).save

@spacex.jobs.build(title:"engineer", date:"17/03/2018",job_type:"fulltime",location:"Hawthorn CA", requirements:"none", salary:1000).save

@solar.jobs.build(title:"truck driver", date:"17/03/2018",job_type:"fulltime",location:"USA", requirements:"none", salary:1000).save
