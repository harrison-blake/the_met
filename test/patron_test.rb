require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class Patrontest < Minitest::Test
  def test_patron_has_attributes
    patron_1 = Patron.new("Bob", 20)

    assert_instance_of Patron, patron_1
    assert_equal "Bob", patron_1.name
    assert_equal 20, patron_1.spending_money
  end

  def test_interests
    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], patron_1.interests
  end
end
