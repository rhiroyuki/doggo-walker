class CreateJoinTableDogWalkingPet < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings_pets do |t|
      t.references :dog_walking, foreign_key: true, index: true, null: false
      t.references :pet, foreign_key: true, index:true, null: false
    end

    add_index :dog_walkings_pets, [:dog_walking_id, :pet_id], unique: true
  end
end
