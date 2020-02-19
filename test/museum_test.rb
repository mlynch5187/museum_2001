require 'minitest/autorun'
require'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < MiniTest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
  end

  def test_museum_exists
    assert_instance_of Museum, @dmns
  end

  def test_museum_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  def test_exhibits_can_be_added_to_museum
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_exhibits_are_recommended_based_upon_interests_of_patron
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    assert_equal ["Gems and Minerals", "Dead Sea Scrolls"], @dmns.recommend_exhibits(@patron_1)
    assert_equal ["IMAX"], @dmns.recommend_exhibits(@patron_2)
  end
end
