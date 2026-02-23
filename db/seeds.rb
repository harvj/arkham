expansions_file = "db/seeds/expansions.csv"
neighborhoods_file = "db/seeds/neighborhoods.csv"
locations_file = "db/seeds/locations.csv"
encounters_file = "db/seeds/encounters.csv"

# 1. Expansions
CSV.foreach(expansions_file, headers: true) do |row|
  Expansion.create!(
    name: row["name"],
    box_type: row["box_type"]&.downcase,
    can_visit: ActiveModel::Type::Boolean.new.cast(row["can_visit"])
  )
end

# 2. Neighborhoods
CSV.foreach(neighborhoods_file, headers: true) do |row|
  Neighborhood.create!(
    name: row["name"],
    expansion_id: row["expansion_id"]
  )
end

# 3. Locations
CSV.foreach(locations_file, headers: true) do |row|
  Location.create!(
    name: row["name"],
    expansion_id: row["expansion_id"],
    neighborhood_id: row["neighborhood_id"]
  )
end

# 4. Encounters
CSV.foreach(encounters_file, headers: true) do |row|
  Encounter.create!(
    description: row["description"],
    expansion_id: row["expansion_id"],
    location_id: row["location_id"]
  )

  if row["expansion_id"] == "9" and !(row["description"].match(/Patrol marker/))
    Encounter.create!(
      description: row["description"],
      expansion_id: 2,
      location_id: row["location_id"]
    )
  end
end
