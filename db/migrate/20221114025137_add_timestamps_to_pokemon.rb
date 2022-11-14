class AddTimestampsToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemon, :created_at, :datetime, null: false
    add_column :pokemon, :updated_at, :datetime, null: false
  end
    
end
