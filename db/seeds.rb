# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.create(title: "rocket engineer", date: "2018/02/06", job_type: "Fulltime", location:"California", requirements:"skills in launching rockets", salary:"NA")

Job.create(title: "star man", date: "2018/02/06", job_type: "Fulltime", location:"outterspace", requirements:"the ability to survive in outterspace", salary:"N?A")

Job.create(title: "human", date: "2018/02/07", job_type: "Fulltime", location:"Earth", requirements:"survive in a hostile environment", salary:"food and shelter")

Job.create(title: "digital Nomad", date: "2018/02/07", job_type: "Fulltime", location:"World Wide", requirements:"enjoy working", salary:"Negotiable")

######

Applicant.create(username:"jon", name:"Jon Doe", address:"123 Main Street", objective:"null", github:"github.com/JonDoe", blog:"JonDoe.com",password:"000")

Applicant.create(username:"jane",name:"Jane Doe", address:"123 Main Street", objective:"null", github:"github.com/JaneDoe", blog:"JaneDoe.com",password:"000")

Applicant.create(username:"elmo",name:"Elmo", address:"123 Sesame Street", objective:"null", github:"github.com/elmo", blog:"elmo",password:"000")

Applicant.create(username:"tesla",name:"Nikola Tesla", address:"123 Tesla Way", objective:"null", github:"github.com/tesla", blog:"tesla.com",password:"000")

######

Company.create(username:"spacex",name:"SpaceX", description:"Make humans multiplanetary", address:"Rocket Road Hawthorne, California", password:"000")

Company.create(username:"unknown",name:"Unknown.inc", description:"self reliable power", address:"3500 Deer Creek Road Palo Alto, CA 94304", password:"000")

Company.create(username:"solar",name:"Solar inc", description:"because it makes sense", address:"444 De Haro Street San Francisco, CA 94107", password:"000")
