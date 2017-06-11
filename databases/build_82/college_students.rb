# require gems
require_relative 'build_database'
require_relative 'prompts'

done = false

puts WELCOME
  input = gets.chomp
  database = College_Students.new(input)

until database.database_done
end

puts CMD_PROMPTS

until done
  input = gets.chomp
  if input == 1

  elsif input.downcase == "done"
  end
end


######### Features ########
# Clear my Database
# Find Student
# => what Major
# => what school
# => update school
# Find a University
# => what is the population
# => who are the students
# => alphabitize
# Create a New Data Base
# Delete My Data Base
