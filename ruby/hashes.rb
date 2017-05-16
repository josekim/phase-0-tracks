# prompt User of information, place symbol on prompt
# insert data into hash using symbol provided in prompt
# repeat this process for all information
# if information makes sense to change to integer or boolean, change it.
# if color create
# => loop untill done
#     add string to an array
#

# Prompt User to change a key value pair
# if none, skip
# else prompt value to be changed
# figure out what value transformation needs to happen

# output data

def color_collector(color,client)
      colors = []
      until color == "done"
      colors.push(color)
      color= gets.chomp
      end
      client[:colors] = colors
end
client = {

}
puts "Please enter your Name(:name)"
  client[:name] = gets.chomp
puts "Please enter your age(:age)"
  client[:age] = gets.chomp.to_i
puts "How many children do you have?(:numChild)"
  client[:numChild] = gets.chomp.to_i
puts "What decoration theme would you like(:themeDecor)"
  client[:themeDecor] = gets.chomp
puts "Do you own your place?(Y/N)(:owner)"
  client[:owner] = (gets.chomp.downcase  == "y")
puts "Would you like a discount?(Y/N)(discount)"
  client[:discount] = (gets.chomp.downcase == "y")
puts "colors that you would like to use(type done when finish)"
    color = gets.chomp
    color_collector(color,client)


puts "Did you make a mistake? options:(name,age,numchild,themeDecor,owner,discount,color)"
  mistake = gets.chomp.to_sym
  if mistake != "none".to_sym
    puts "Please give new value for #{mistake}"
    newValue = gets.chomp
    if (mistake == :name) || (mistake == :themeDecor)
      client[mistake] = newValue
    elsif (mistake == :age) || (mistake == :numChild)
      client[mistake] = newValue
    elsif (mistake == :owner) || (mistake == :discount)
      client[mistake] = (newValue.downcase == "y")
    elsif (mistake == :color)
      color_collector(newValue,client)
    end
  end


puts client







