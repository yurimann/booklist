# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.create!(title: "The Secret History", author: "Donna Tartt", already_read: true)
Book.create!(title: "Why's (Poignant) Guide to Ruby", author: "Why the Lucky Stiff", already_read: true)
Book.create!(title: "Pink Noises", author: "Tara Rodgers", already_read: false)
