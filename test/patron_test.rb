require 'minitest/autorun'
require'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < MiniTest::Test

  def setup
    @patron_1 = Patron.new("Bob", 20)
  end

  def test_patrons_exist
    assert_instance_of Patron, @patron_1
  end
end



# pry(main)> patron_1.name
# # => "Bob"
#
# pry(main)> patron_1.spending_money
# # => 20
#
# pry(main)> patron_1.interests
# # => []
#
# pry(main)> patron_1.add_interest("Dead Sea Scrolls")
#
# pry(main)> patron_1.add_interest("Gems and Minerals")
#
# pry(main)> patron_1.interests
# # => ["Dead Sea Scrolls", "Gems and Minerals"]
# ```
