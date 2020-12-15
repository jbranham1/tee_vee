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
end
