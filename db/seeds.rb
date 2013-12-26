# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


workshop = Category.create name: "Workshop"
tire_repairer = Category.create name: "Tire Repairer"
honda = Category.create name: "Honda"
suzuki = Category.create name: "Suzuki"
yamaha = Category.create name: "Yamaha"	