class MovingColumnsInPokemon < ActiveRecord::Migration[6.1]
  def up
    change_column :pokemon, :second_type, :string, after: :first_type
  end
end
