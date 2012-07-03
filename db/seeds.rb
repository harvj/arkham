# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Expansions
CSV.foreach("db/seed/expansions.csv") do |row|
  Expansion.create!(:name => row[0])
end

# Neighborhoods
CSV.foreach("db/seed/neighborhoods.csv") do |row|
  Neighborhood.create!(:name => row[1], :expansion_id => row[0])
end

# Locations
CSV.foreach("db/seed/locations.csv") do |row|
  Location.create!(:name => row[2], :expansion_id => row[0], :neighborhood_id => row[1])
end

# Arkham Encounters
CSV.foreach("db/seed/encounters.csv") do |row|
  Encounter.create!(:description => row[2], :expansion_id => row[0], :location_id => row[1])
end