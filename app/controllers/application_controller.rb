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

  

end
