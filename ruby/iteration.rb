#def message(name)
#  puts "user status: inactive"
#  yield(name)
#  puts "user status: active"
#end

#message(joseph) {|name| puts name}


names = ["Joseph", "Garima", "Tim", "John", "Kim"]

contact_details = {
  :phone => "423-578-9129",
  :email => "joseph@gmail.com"
}

puts names
names.each do |names|
  names = "James"
  end
puts names

puts contact_details
contact_details.each do |contact, details|
  details = "N/A"
end
puts contact_details

puts names
names.map! do |names|
  names = "James"
 end
puts names

number = [1,2,3,4,5,6,7,8,9,10]
numberhash = {
  one:1,
  two:2,
  three:3,
  four:4
}
p number.delete_if {|number| number < 4}
p numberhash.delete_if {|key,value| key == :one}
number = [1,2,3,4,5,6,7,8,9,10]
numberhash = {
  one:1,
  two:2,
  three:3,
  four:4
}
p number.select {|number| number.odd?}
p numberhash.select {|key,value| key ==:one}
number = [1,2,3,4,5,6,7,8,9,10]
numberhash = {
  one:1,
  two:2,
  three:3,
  four:4
}
p number.keep_if {|number| number.even?}
p numberhash.keep_if {|key,value| key ==:two}

number = [1,2,3,4,5,6,7,8,9,10]
numberhash = {
  one:1,
  two:2,
  three:3,
  four:4
}
p number.drop_while {|number| number < 7}

