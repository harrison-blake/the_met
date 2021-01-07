require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class Museumtest < Minitest::Test
  def test_museum_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end
end
