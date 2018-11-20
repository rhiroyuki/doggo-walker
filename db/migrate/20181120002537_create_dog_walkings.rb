# frozen_string_literal: true

class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      t.integer :status, default: 0
      t.date :scheduled_on
      t.decimal :price_value, precision: 8, scale: 2, default: 0, null: false
      t.integer :scheduled_duration, default: 0
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
