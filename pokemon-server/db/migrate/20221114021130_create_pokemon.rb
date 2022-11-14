class CreatePokemon < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.string :types
      t.string :sprite
    end
  end
end
