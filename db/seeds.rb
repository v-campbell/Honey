# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WorkerBee.destroy_all
Comb.destroy_all
Advisement.destroy_all

comb1 = Comb.create({sweet_spot: })


bee1 = WorkerBee.create({comb_id: comb1.id})


advisement1 = Advisement.create({comb_id: comb1.id})
