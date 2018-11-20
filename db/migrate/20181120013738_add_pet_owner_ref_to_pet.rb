class AddPetOwnerRefToPet < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :pet_owner, foreign_key: true, index: true
  end
end
