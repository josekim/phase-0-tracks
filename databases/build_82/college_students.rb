# require gems
require_relative 'build_database'

done = false

puts "Welcome to College Student Data base Creator, Please type File name you would like to access or create"
  input = gets.chomp
  data_base = College_Students.new(input)
until done
  input = gets.chomp
  if(input.downcase == 'done')
    done = true;
  end

end