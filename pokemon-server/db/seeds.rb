
puts "🌱 Seeding Pokemon..."

# Makes Trainers
5.times do
    Trainer.create(name: Faker::Name.name)
end

5.times do 
    |i|
    pokemon_ids = Array.new(6) { rand(1..905) }

    pokemon_ids.each do |pokemon_id|
        response = RestClient.get "https://pokeapi.co/api/v2/pokemon/#{pokemon_id}/"
        pokemon_id_hash = JSON.parse(response)
        type_array = pokemon_id_hash["types"]
        case type_array.length
        when 2 
            first_type = pokemon_id_hash["types"][0]["type"]["name"]
            second_type = pokemon_id_hash["types"][1]["type"]["name"]
        else 
            first_type = pokemon_id_hash["types"][0]["type"]["name"]
            second_type = "N/A"
        end
        
        Pokemon.create(
            pokemon_ID: pokemon_id,
            name: pokemon_id_hash["name"],
            first_type: first_type,
            second_type: second_type,
            sprite: pokemon_id_hash["sprites"]["other"]["official-artwork"]["front_default"],
            trainer_id: i + 1
            )
    end

end

puts "✅ Done seeding!"
