class RenamingColumnInPokemon < ActiveRecord::Migration[6.1]
  def change
    rename_column :pokemon, :types, :first_type
  end
end
