require 'minitest/pride'
require 'minitest/autorun'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < MiniTest::Test
  def test_it_exists
    nbc = Network.new("NBC")
    assert_instance_of Network, nbc
  end

  def test_it_has_readable_attributes
    nbc = Network.new("NBC")
    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_add_show
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)

    assert_equal [knight_rider], nbc.shows
  end

  def test_main_characters
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert_equal [kitt], nbc.main_characters
  end

  def test_actors_by_show
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    actors_hash = {
      knight_rider => ["David Hasselhoff", "William Daniels"],
      parks_and_rec => ["Amy Poehler", "Nick Offerman"]
    }

    assert_equal actors_hash, nbc.actors_by_show
  end

  def test_shows_by_actor
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    nbc.add_show(baywatch)

    actors_hash = {
      "David Hasselhoff" => [knight_rider, baywatch],
      "William Daniels" => [knight_rider],
      "Amy Poehler" => [parks_and_rec],
      "Nick Offerman" => [parks_and_rec]
    }

    assert_equal actors_hash, nbc.shows_by_actor
  end

  def test_find_all_actors
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    nbc.add_show(baywatch)

    actors= ["David Hasselhoff", "William Daniels", "Amy Poehler", "Nick Offerman"]

    assert_equal actors, nbc.find_all_actors
  end

  def test_find_shows_for_actor
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(baywatch)

    actor = "David Hasselhoff"
    shows = [knight_rider, baywatch]

    assert_equal shows, nbc.find_shows_for_actor(actor)
  end
end
