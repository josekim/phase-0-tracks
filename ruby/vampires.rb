############Functions that are defined for Vampire Program###########
#Utility functions for the comparison portion - return true or false
#need Insurance?
def needInsurance(plan)
  plan.downcase == "yes" || plan.downcase == "y"
end
#Is the age Right?
def ageIsRight(year,age)
  (2017 == year + age) && (age < 100)
end
#do they eat Garlic?
def eatGarlic(bread)
  bread.downcase == "yes" ||  bread.downcase == "y"
end
def vampireName(name)
  name.downcase == "Drake Cula".downcase || name.downcase == "Tu Fang".downcase
end

# function for calling the survey
def survey(employeeNumber)
  #survey Questions
  puts "What is your name?"
    name = gets.chomp
  puts "How old Are you?"
    age = gets.chomp.to_i
  puts "What year were you born"
    year = gets.chomp.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you"
    bread = gets.chomp
  puts "Would you like to enroll in the company's health insurance?"
    plan = gets.chomp
  puts "List all allergies seperated with enter(Type done when finish)"
    allergy = nil
    until (allergy == "done" || allergy  == "sunshine")
      allergy = gets.chomp.downcase
    end

  # check Allergy is sunshine
  is_vampire = "Results inconclusive"
  if(allergy == "sunshine")  # skip if comparison if allergy is sunshine
    is_vampire = "Probably a vampire"
  else
    #condition matching
    if (ageIsRight(year,age) && (eatGarlic(bread) || needInsurance(plan)))
      is_vampire = "Probably not a vampire"
    end
    if (!ageIsRight(year,age) && (!eatGarlic(bread) || !needInsurance(plan)))
      is_vampire = "Probably a vampire"
    end
    if (!ageIsRight(year,age) && !eatGarlic(bread) && !needInsurance(plan))
      is_vampire = "Almost certainly a vampire"
    end
    if (vampireName(name))
      is_vampire = "Definitely a vampire"
    end
  end

  puts "Results for Employee #{employeeNumber}: #{is_vampire}"
end
############# end Function Defines #############

######## the program really starts here ######
puts "How many employees will be processed?"
 numberOfEmployees = gets.chomp.to_i
for i in 1..numberOfEmployees
  survey(i)
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
######## Program ends Here ##########