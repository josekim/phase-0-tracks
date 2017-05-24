class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
    puts "#{"Woof " *int}!"
  end

  def roll_over()
    puts "*Rolls over*"
  end

  def dog_years(int)
    int * 7
  end

  def sniff(item)
    puts "I sniffed the #{item}"
  end

  def initialize
    puts "Initializing new puppy instance..."
  end

end

tj = Puppy.new
tj.fetch("shoe")
tj.speak(9)
tj.roll_over
p tj.dog_years(5)
tj.sniff("toilet")

class Homework

  def initialize
    puts "Starting new homework assignment..."
  end

  def doing_hw(subject)
    puts "Doing #{subject} homework..."
  end

  def submit_hw(subject)
    puts "Submitting #{subject} homework..."
  end

end

students = []
for student in 1..50
  students << Homework.new
end

students.each {|student|
  student.doing_hw("Italian")
  student.submit_hw("Algebra")
}

p students.length