def get_name(person)
  return person[:name]
end

def get_tv_show(person)
  return person[:favourites][:tv_show]
end

def likes_to_eat(person, food)
  if @person1[:favourites][:things_to_eat][0] == food
    return true
  end
end
