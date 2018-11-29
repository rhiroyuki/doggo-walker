[![CircleCI](https://circleci.com/gh/rhiroyuki/doggo_walker.svg?style=svg)](https://circleci.com/gh/rhiroyuki/doggo_walker)

# DoggoWalker System

<img src="https://www.publicdomainpictures.net/pictures/120000/velka/dog-walking-1425056286ZHy.jpg" width="250">

## Requirements
- Ruby 2.5.3
- Rails 5.2
- Postgres

## Setup
`$ bin/setup`

## API Endpoints

------
### PUT /api/v1/dog_walkings/:id/start_walk(.:format)
```
# param example
params: { id: dog_walking.id }
```
------

### PUT /api/v1/dog_walkings/:id/finish_walk(.:format)
```
# param example
params: { id: dog_walking.id }
```
------
### GET /api/v1/dog_walkings(.:format)

------
### POST /api/v1/dog_walkings(.:format)
```
# param example
params = {
  dog_walking: {
    scheduled_on: '2018-11-21',
    price_value: 0,
    scheduled_duration: 30,
    latitude: 30.00,
    longitude: 12.00,
    started_at: nil,
    ended_at: nil,
    pets: [pet_ids]
  }
}

```
------
### GET /api/v1/dog_walkings/:id(.:format)
```
# param example
params = { id: 1 }
```
