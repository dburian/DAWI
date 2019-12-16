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


# Populate database
require 'faker'

ARCHS = 10
PROJS = 10
IMGS = 5
img_names = ["apartments_2017.jpg", "apartments_2018.jpg", "apartments_2019_a.jpg", "apartments_2019_b.jpg", "office_2017.jpg", "office_2018.jpg", "office_2019.jpg", "office_panorama.jpg", "public_2017.jpg", "public_2018_a.jpg", "public_2018_b.jpg", "public_2019.jpg"]

ARCHS.times do
	Architect.create(
		name:        Faker::Name.first_name + " " + Faker::Name.last_name,
		desc:        Faker::Lorem.paragraph(sentence_count: 2),
		position_id: Faker::Number.between(from: 1, to: 2)
	)
end

# 10.times do
# 	ProjectArchitectAssociation.create(
# 		architect_id: Faker::Number.between(from: 1, to: ARCHS),
# 		project_id:   Faker::Number.between(from: 1, to: PROJS)
# 	)
# end

PROJS.times do

	architects_ids_temp = []

	(rand(ARCHS/3)+1).times do
		architects_ids_temp.push(Faker::Number.between(from: 1, to: ARCHS))
	end

	p = Project.create(
		name:         Faker::Games::WorldOfWarcraft.hero, 
		long_desc:    Faker::Lorem.paragraph(sentence_count: 6),
		short_desc:   Faker::Games::WorldOfWarcraft.quote,
		year:         Faker::Number.between(from: 2010, to: 2019),
		function_id:  Faker::Number.between(from: 1, to: 4),
		status_id:    Faker::Number.between(from: 1, to: 3),
		architect_ids: architects_ids_temp
	)

	img_tmp = img_names[rand(img_names.length)]

	(rand(IMGS)+1).times do
		p.images.attach(io: File.open(Rails.root.join('app/assets/images', img_tmp)), filename: img_tmp)
	end

end


# TABLES: "architect_positions", "architects", "admins", "project_architect_associations", "project_functions", "active_storage_blobs", "active_storage_attachments", "projects", "project_statuses", "schema_migrations", "ar_internal_metadata"

# Architect: "id", "name", "desc", "created_at", "updated_at", "position_id"
# Project: "id", "name", "long_desc", "short_desc", "year", "function_id", "status_id"
# Associations: "id", "created_at", "updated_at", "architect_id", "project_id"
