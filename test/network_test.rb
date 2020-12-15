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
end
