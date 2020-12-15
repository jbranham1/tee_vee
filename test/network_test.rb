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
end
