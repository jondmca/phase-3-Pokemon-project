class AddSecondTypingToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemon, :second_type, :string
  end
end
