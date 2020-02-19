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
    @patron_3 = Patron.new("Johnny", 5)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")
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

    assert_equal ["Gems and Minerals", "Dead Sea Scrolls"], @dmns.recommend_exhibits(@patron_1)
    assert_equal ["IMAX"], @dmns.recommend_exhibits(@patron_2)
  end

  def test_patrons_can_be_admitted_to_the_museum
    assert_equal [], @dmns.patrons

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    assert_equal [@patron_1, @patron_2, @patron_3], @dmns.patrons
  end
end



# - For `patrons_by_exhibit_interest`, this method takes no arguments and returns a Hash where each key is an Exhibit. The value associated with that Exhibit is an Array of all the Patrons that have an interest in that exhibit.
# - `ticket_lottery_contestants` returns an array of patrons that do not have enough money to see an exhibit, but are interested in that exhibit. The lottery winner is generated randomly based on the available contestants when `draw_lottery_winner` is called.
# - You will need to use a **stub** to test the `announce_lottery_winner` method in conjunction with the `draw_lottery_winner` method. JOY!
# pry(main)> patron_3.add_interest("Dead Sea Scrolls")

# #Patrons are added even if they don't have enough money for all/any exhibits.
#
# pry(main)> dmns.patrons_by_exhibit_interest
# # =>
# # {
# #   #<Exhibit:0x00007fb202238618...> => [#<Patron:0x00007fb2011455b8...>],
# #   #<Exhibit:0x00007fb202248748...> => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x00007fb20227f8b0...>, #<Patron:0x6666fb20114megan...>],
# #   #<Exhibit:0x00007fb20225f8d0...> => []
# # }
#
# pry(main)> dmns.ticket_lottery_contestants(dead_sea_scrolls)
# # => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x6666fb20114megan...>]
#
# pry(main)> dmns.draw_lottery_winner(dead_sea_scrolls)
# # => "Johnny" or "Bob" can be returned here. Fun!
#
# pry(main)> dmns.draw_lottery_winner(gems_and_minerals)
# # => nil
#
# #If no contestants are elgible for the lottery, nil is returned.
#
# pry(main)> dmns.announce_lottery_winner(dead_sea_scrolls)
# # => "Bob has won the Dead Sea Scrolls exhibit lottery"
#
# # The above string should match exactly, you will need to stub the return of `draw_lottery_winner` as the above method should depend on the return value of `draw_lottery_winner`.
#
# pry(main)> dmns.announce_lottery_winner(gems_and_minerals)
# # => "No winners for this lottery"
#
# # If there are no contestants, there are no winners.
# ```
