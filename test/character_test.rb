require 'minitest/pride'
require 'minitest/autorun'
require './lib/character'

class CharacterTest < MiniTest::Test
  def test_it_exists
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    character = Character.new(character_hash)

    assert_instance_of Character, character
  end

  def test_it_has_readable_attributes
    character_hash = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    character = Character.new(character_hash)

    assert_equal "KITT", character.name
    assert_equal "William Daniels", character.actor
    assert_equal 1_000_000, character.salary
  end
end
