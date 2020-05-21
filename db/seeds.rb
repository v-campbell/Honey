# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Advisement.destroy_all
Comb.destroy_all
Hive.destroy_all
NectarDosage.destroy_all
PollenCollected.destroy_all
WorkerBee.destroy_all

comb1 = Comb.create({sweet_spot: 13})
bees = []
bees.push(WorkerBee.create({comb_id:comb1.id}))
bees.push(WorkerBee.create({comb_id:comb1.id}))
bees.push(WorkerBee.create({comb_id:comb1.id}))
counter = 0
(0...50).each do |date|
    fakeDate = Faker::Date.between(from: (date*3).days.ago, to: (date*3+2).days.ago)
    bees.each do |bee|
        fakeNectarDosage = 0
        if Faker::Number.within(range: 1...14) != 1
            fakeNectarDosage = Faker::Number.between(from: 2, to: 200)* 100
        end
        NectarDosage.create({bee_id: bee.id, date_given: fakeDate,
            nectar_dosage: fakeNectarDosage})
        if counter % 2 == 1
            PollenCollected.create({bee_id: bee.id, date_collected: fakeDate,
                pollen_globs_collected: Faker::Number.between(from: 5.0, to:17.9)})
        end
    end

    if counter % 5 == 1
        Advisement.create({comb_id: comb1.id, date_given:fakeDate, value: Faker::Number.between(from: 2, to: 200)* 100})
    end
    counter += 1 
end

