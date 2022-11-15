class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "🌱 Seeded Data Instructions: 🌱

    trainer IDs = 1 through 5
    pokemon IDs = 1 through 30

    /pokemon = Shows a list of all randomized Pokemon.
    /trainers = Shows a list of all trainers.
    /trainers/:id = Shows an individual trainer and their Pokemon.
    /trainers_pokemon = Shows all trainers and their Pokemon.
    /trainers_pokemon/:id = Shows a specific trainer and their Pokemon details.
    /pokemon/:id = Shows an individual Pokemon, their details and their respective trainer.
    "
  end

  get "/pokemon" do
    pokemon = Pokemon.all
    pokemon.to_json
  end

  get "/trainers" do
    trainer = Trainer.all
    trainer.to_json
  end

  get "/trainers/:id" do
    trainer = Trainer.find(params[:id])
    trainer.to_json(include: {
      pokemons: {only: [:name]}
    })
  end

  get "/trainers_pokemon" do
    trainer = Trainer.all
    trainer.to_json(only: [:name], include: {
      pokemons: {only: [:name]}
    })

  end

  get "/trainers_pokemon/:id" do
    trainer = Trainer.find(params[:id])
    pokemon = trainer.pokemons
    pokemon.to_json(only: [:pokemon_ID, :name, :first_type, :second_type], include: {
      trainer: { only: [:name]}
    })
  end

  get "/pokemon/:id" do
    pokemon = Pokemon.find(params[:id])
    pokemon.to_json(include: {
      trainer: {only: [:name]}
    })
  end

  delete "/pokemon/:id" do
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy
    pokemon.to_json
  end

  post "/pokemon" do
    pokemon = Pokemon.create(
      pokemon_ID: params[:pokemon_ID],
      name: params[:name],
      first_type: params[:first_type],
      second_type: params[:second_type],
      sprite: params[:sprite],
      trainer_id: params[:trainer_id]
    )
    pokemon.to_json
  end

  patch "/pokemon/:id" do
    pokemon = Pokemon.find(params[:id])
    pokemon.update(
      name: params[:name],
      second_type: params[:second_type]
    )
    pokemon.to_json
  end

end
