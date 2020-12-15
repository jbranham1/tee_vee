require 'minitest/pride'
require 'minitest/autorun'
require './lib/character'
require './lib/show'

class ShowTest < MiniTest::Test
  def test_it_exists
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_kight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    assert_instance_of Show, knight_rider
  end

  def test_it_has_readable_attributes
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_kight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal "KITT", knight_rider.name
    assert_equal "William Daniels", knight_rider.creator
    assert_equal 1_000_000, knight_rider.characters
  end
end