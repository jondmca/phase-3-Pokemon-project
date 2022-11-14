class DeletingCurrentPokemonTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :pokemon
  end
end
