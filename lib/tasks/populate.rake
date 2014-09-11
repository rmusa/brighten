# namespace :db do
# 	desc "Populate the database with data"
# 	task populate: 'db:setup' do

# 		["Children", "Animals", "Health", "Food", "Education", "Technology", "Environment", "Housing", "Seniors", "Sport", "Culture", "Other"].each do |tag|
# 			Tag.create(name: tag)
# 		end

# 		10.times do 
# 			user = User.create do |u|
# 				u.name = Faker::Name.name
# 				u.email = Faker::Internet.email
# 				u.password = "password"
# 				u.password_confirmation = "password"
# 			end

# 			20.times do
# 				organization = user.organizations.create do |o|
# 					o.name = Faker::Company.name
# 					o.phone = Faker::PhoneNumber.phone_number
# 					o.email = Faker::Internet.email
# 					o.description = Faker::Lorem.paragraph 
# 					o.website = "www.example.com"
# 					o.address = Faker::Address.street_address			
# 				end

# 				Tag.all.pluck(:id).sample(2).each do |tag_id|
# 					Tagging.create(tag_id: tag_id, taggable_id: organization.id, taggable_type: "Organization")
# 				end

# 				3.times do
# 					event = organization.events.create do |e|
# 						e.name = Faker::Lorem.sentence
# 						e.location = Faker::Address.street_address
# 						e.description = Faker::Lorem.paragraph
# 						e.date = rand(1.year).from_now.to_date
# 						e.time = rand(1.year).from_now
# 						e.endtime = e.time + 1.hour
# 						e.event_email = Faker::Internet.email
# 					end

# 					Tag.all.pluck(:id).sample(2).each do |tag_id|
# 						Tagging.create(tag_id: tag_id, taggable_id: event.id, taggable_type: "Event")
# 					end

# 				end
# 			end
# 		end
# 	end
# end