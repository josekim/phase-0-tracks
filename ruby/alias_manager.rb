# take first and last name
# split string from each other
# split characters in each first and last name
# for each letter in name,
#  if vowel, move the next vowel
#  else move to next letter
# rejoin letters and capitalize name
# rejoin last name and then first name to one string
def indexOfVowel(letter,vowels)
  vowels.index(letter)
end

def nextLetter(letter)
  vowels = "aeioua"
  if (indexOfVowel(letter,vowels) != nil)
    return vowels[indexOfVowel(letter,vowels)+1]
  else
    if (indexOfVowel(letter.next,vowels) != nil)
      return letter.next.next
    elsif (letter.next == "aa")
      return 'b'
    else
      return letter.next
    end
  end
end

=begin Version 1 of nameEncryptor. has issues if name is only one name or include middle name
def nameEncryptor(name)
  split_name = name.downcase.split(" ")
  firstname = split_name[0]
  lastname = split_name[1]
  firstname = firstname.split('').map! {|letter|
    letter = nextLetter(letter)}.join('')
  lastname = lastname.split('').map! {|letter|
    letter = nextLetter(letter)}.join('')
  return lastname.capitalize + " " + firstname.capitalize
end
=end

def nameEncryptorV2(name)
  name.downcase.split(" ").map!{|name| name.split('').map! {|letter| nextLetter(letter)}.join('').capitalize}.reverse.join(" ")
end

secretNames = {}
nameInput= ''
until (nameInput.downcase == 'quit')
  puts "Type in a name or quit"
  nameInput=gets.chomp.split(' ').map!{|name| name.capitalize}.join(" ")
  if (nameInput.downcase !='quit' && !nameInput.empty?)
    puts secretNames[nameInput] = nameEncryptorV2(nameInput)
  end
end

secretNames.each {|name,secretName| puts "#{secretName} is actually #{name}"}

