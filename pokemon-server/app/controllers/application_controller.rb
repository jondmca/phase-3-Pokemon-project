class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
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
    pokemon.to_json
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
