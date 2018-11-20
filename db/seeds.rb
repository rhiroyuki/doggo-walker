5.times do |i|
  owner = PetOwner.create(name: "PetOwner#{i}")
  Pet.create(name: "Doggo #{i}", pet_owner: owner, breed: 'Chihuahua')
  Pet.create(name: "Dogginho #{i}", pet_owner: owner, breed: 'Yorkshire')
  Pet.create(name: "Doggão #{i}", pet_owner: owner, breed: 'Akita')
end

pets = Pet.where(breed: 'Akita')
DogWalking.create(
  pets: pets,
  price_value: 150.0,
  scheduled_duration: 30,
  scheduled_on: Time.now + 1.day)

pets = Pet.where(breed: 'Yorkshire')
DogWalking.create(
  pets: pets,
  price_value: 90.0,
  scheduled_duration: 60,
  scheduled_on: Time.now + 1.day)

ended_at = Time.now - 1.day - 30.minutes
pets = Pet.where(breed: 'Chihuahua')
DogWalking.create(
  pets: pets,
  price_value: 60.0,
  scheduled_duration: 30,
  scheduled_on: Time.now - 1.day,
  started_at: Time.now - 1.day,
  ended_at: ended_at)

