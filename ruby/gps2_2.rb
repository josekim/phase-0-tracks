# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Take the string and split it
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add the item name to the list
      # update quanity as needed
# output: [list that is updated]

# Method to remove an item from the list
# input:  list, item name
# steps: remove the item from list
# output: [List that is updated]

# Method to update the quantity of an item
# input: list, item, quanity
# steps: change the quanity of items
# output: list that is updated

# Method to print a list and make it look pretty
# input: list
# steps: for each item in the list
      # print in a nice format
# output: list
DEFAULT_QUANTITY = 0
def create_list(item_string)
  items = item_string.split(" ")
  item_list = {}
  items.each do |item|
    item_list[item] = DEFAULT_QUANTITY
  end
  item_list
end

def add_item(item_list, item, quantity=DEFAULT_QUANTITY)
  item_list[item] = quantity
  item_list
end

def remove_item(item_list, item)
  item_list.delete(item)
  item_list
end

def change_quantity(item_list, item, quantity)
  add_item(item_list,item,quantity)
#  item_list[item] = quantity
#  item_list
end

def print_list(item_list)
    puts "Here is the list of items in the bag"
  item_list.each do |item, quantity|
    puts "There are #{quantity} of #{item}"
  end
end


####################Drive Code ################
list1 = create_list("carrots apples cereal pizza")
p add_item(list1,"Lemonade", 2 )
p add_item(list1,"Tomatoes", 3 )
p add_item(list1,"Onions", 1 )
p add_item(list1,"Ice Cream", 4 )
p remove_item(list1,"Lemonade")
p change_quantity(list1, "Ice Cream", 1)
print_list(list1)
