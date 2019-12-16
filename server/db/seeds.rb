# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProjectFunction.create name: "Public Building"
ProjectFunction.create name: "Residential Building"
ProjectFunction.create name: "Administration Building"
ProjectFunction.create name: "Urbanism"

ProjectStatus.create name: "In Construction"
ProjectStatus.create name: "Planned"
ProjectStatus.create name: "Built"

ArchitectPosition.create(name: "Leading Architect")
ArchitectPosition.create(name: "Project Architect")

Admin::Admin.create name: "admin", email: "admin@fact.com", password: "admin", password_confirmation: "admin"
