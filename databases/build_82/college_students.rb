# require gems
require_relative 'build_database'
require_relative 'prompts'

done = false

puts WELCOME
  input = gets.chomp
  database = College_Students.new(input)

until database.database_done
end



until done
  puts CMD_PROMPTS
  input = gets.chomp
  if input.to_i == 1
    puts SEARCH_STUDENT_PROMPT
    option = gets.chomp
    puts SEARCH_TERM
    term = gets.chomp
    database.search(option.to_i,term)
  elsif input.to_i == 2
    puts GET_FIRST_NAME
    first_name = gets.chomp
    puts GET_LAST_NAME
    last_name = gets.chomp
    puts GET_AGE
    age = gets.chomp
    puts GET_UNIVERSITY
    university = gets.chomp
    puts GET_MAJOR
    major = gets.chomp
    database.create_new_student(first_name, last_name, age, university, major)
  elsif input.downcase == "done"
    done = true
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
