class AddTrainerIdToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemon, :trainer_id, :integer
  end
end