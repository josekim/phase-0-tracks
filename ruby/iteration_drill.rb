# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ---
puts zombie_apocalypse_supplies.join(" * ")

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----

sort_zombie_apocalypse_supplies = []




# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----
def exist(string,array)
  array.each {|item|
    if string == item
     return true
    end
}
  return false
end

p exist("hatchet",zombie_apocalypse_supplies)

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----
def remove(array)
  length =array.length - 5
  if(length > 0)
    length.times {array.pop}
  end
  return array
end
p remove(zombie_apocalypse_supplies)

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----
p zombie_apocalypse_supplies.concat(other_survivor_supplies)

# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----
def createString(hash)
array = []
hash.each{|key,value|
  array.push("#{key} - #{value}")}
return array.join(" * ")
end
p createString(extinct_animals)

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----
def removeAnimal(hash,limit)
  hash.each {|key,value|
    if value >= limit
      hash.delete(key)
    end
  }
  return hash
end
p removeAnimal(extinct_animals,2000)

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----
def updateAnimal(hash)
  hash.each{|key,value|
    hash[key] = value - 3
  }
  return hash
end
p updateAnimal(extinct_animals)

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----
def checkAlive(hash,animal)
  hash.each {|key,value|
  if key == animal
    return true
  end
  }
  return false
end
p checkAlive(extinct_animals,"Andean Cat")
p checkAlive(extinct_animals,"Dodo")
p checkAlive(extinct_animals,"Saiga Antelope")

# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----

p extinct_animals.reject {|key,value| key != "Passenger Pigeon"}.to_a