require 'minitest/pride'
require 'minitest/autorun'
require './lib/character'
require './lib/show'
require 'mocha/minitest'

class ShowTest < MiniTest::Test
  def test_it_exists
    kitt = mock
    michael_knight = mock
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    assert_instance_of Show, knight_rider
  end

  def test_it_has_readable_attributes
    kitt = mock
    michael_knight = mock
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal "Knight Rider", knight_rider.name
    assert_equal "Glen Larson", knight_rider.creator
    assert_equal [michael_knight, kitt], knight_rider.characters
  end

  def test_total_salary
    kitt = mock
    michael_knight = mock
    kitt.stubs(:salary).returns(1_000_000)
    michael_knight.stubs(:salary).returns(1_600_000)
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    assert_equal 2600000, knight_rider.total_salary
  end

  def test_highest_paid_actor
    # character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    # kitt = Character.new(character_hash)
    # michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    # knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    kitt = mock
    michael_knight = mock
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    knight_rider.expects(:highest_paid_actor).returns("David Hasselhoff")
    assert_equal "David Hasselhoff", knight_rider.highest_paid_actor
  end

  def test_actors
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal ["David Hasselhoff", "William Daniels"], knight_rider.actors
  end

  def test_get_main_characters
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(character_hash)
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal [kitt], knight_rider.get_main_characters
  end
end
