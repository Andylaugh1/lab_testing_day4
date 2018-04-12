def get_name(person)
  return person[:name]
end

def get_tv_show(person)
  return person[:favourites][:tv_show]
end

def likes_to_eat(person, food)
  if person[:favourites][:things_to_eat][0] == food
    return true
  end
end

def add_new_friend(person, new_friend)
  person[:friends].push(new_friend)
end

def remove_friend(person, old_friend)
  person[:friends].delete(old_friend)
end

def total_money(person_array)
    money = 0
    for person in person_array
      money += person[:monies]
    end
    return money
end

def lend_money(lender, lendee, amount)
  #take lender, reduce lender balance, give amount, increase lendee balance
  # lendee[:monies].push(amount)
  lender[:monies] -= amount
  lendee[:monies] += amount# lendee[:monies] + amount

end
