class NewPokemonTable < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :first_type
      t.string :second_type
      t.string :sprite
      t.integer :trainer_id
      t.timestamps
    end
  end
end
