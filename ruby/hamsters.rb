
puts "What is the hamsters name?"
  name = gets.chomp
puts "How loud is the hamster? (1-10)"
  volume = gets.chomp.to_i
puts "What color fur does it have?"
  fur = gets.chomp
verdict = nil
until verdict != nil
puts "Is this a good candidate for adoption (y/n)?"
  verdict = gets.chomp.downcase
  if verdict == "y"
    verdict = true
  elsif verdict == "n"
    verdict = false
  else
    verdict = nil
  end
end

puts "What is the hamster's age?"
  age = gets.chomp
if age == ""
  age = nil
else
  age.to_i
end

puts "Hamster:    #{name}."
puts "Loudness:   #{volume}."
puts "Fur Color:  #{fur}."
puts "Adoption:   #{verdict}"
puts "Hamster Age:#{age}"