
puts "🌱 Seeding Pokemon..."

# Makes Trainers
5.times do
    Trainer.create(name: Faker::Name.name)
end

5.times do 
    i = 1
    pokemon_ids = Array.new(6) { rand(1..905) }

    pokemon_ids.each do |pokemon_id|
        response = RestClient.get "https://pokeapi.co/api/v2/pokemon/#{pokemon_id}/"
        pokemon_id_hash = JSON.parse(response)
        
        Pokemon.create(
            pokemon_ID: pokemon_id,
            name: pokemon_id_hash["name"],
            #  if (pokemon_id_hash["types"].length = 2)
            #      first_type: pokemon_id_hash["types"][0]["type"]["name"],
            #      second_type: pokemon_id_hash["types"][1]["type"]["name"],
            # else
            first_type: pokemon_id_hash["types"][0]["type"]["name"],
            second_type: "N/A",
            # end
            sprite: pokemon_id_hash["sprites"]["other"]["official-artwork"]["front_default"]
            
            )
        end
end

puts "✅ Done seeding!"
