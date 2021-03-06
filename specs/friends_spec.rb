require( 'minitest/autorun' )
require("minitest/rg")
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Dave", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Baywatch",
        things_to_eat: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      }
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Dave"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      }
    }

    @person5 = {
      name: "Dave",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Dave", result)
  end

  # 2. For a given person, return their favourite tv show
  def test_getting_tv_show
    result = get_tv_show(@person3)
    assert_equal("Pokemon", result)
  end
  # (e.g. the function favourite_tv_show(@person2) should return the string "Baywatch")


  # 3. For a given person, check if they like a particular food
  # (e.g. the function likes_to_eat(@person3, "stew") should return true, likes_to_eat(@person3, "spinach") should return false)
  def test_likes_to_eat
    result = likes_to_eat(@person1, "charcuterie")
    assert_equal(true, result)
  end

  # 4. For a given person, add a new name to their list of friends
  # (e.g. the function add_friend(@person2, "Darren") should add Darren to the friends.)
  # (hint: This function should not return anything. After the function call, check for the length of the friends array to test it!)

  def test_add_new_friend
    add_new_friend(@person2, "Eilidh")
    result = @person2[:friends].length
    assert_equal(2, result)
  end


  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)
  def test_remove_friend
      remove_friend(@person1, "Val")
      result = @person1[:friends].length
      assert_equal(3, result)
  end

  # 6. Find the total of everyone's money
  # (hint: use the @people array, remember how we checked the total number of eggs yesterday?)
   def test_total_everyone_money
      result = total_money(@people)
      assert_equal(143,result)
   end

  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: our function will probably need 3 arguments passed to it... the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed, maybe two assertions?)
  def test_borrow_money_from_lender
     lend_money(@person5, @person1, 20)
     lender_money =  @person5[:monies]
     lendee_money = @person1[:monies]
     assert_equal(80, lender_money)
     assert_equal(21, lendee_money)
  end



  # 8. Find the set of everyone's favourite food joined together
#   # (hint: concatenate the favourites/things_to_eat arrays together)
def test_join_favourite_foods
  join_foods(@people)
  result = total_food(@people).length
  assert_equal(7, result)
end


  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)

end
