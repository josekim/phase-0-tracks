# take first and last name
# split string from each other
# split characters in each first and last name
# for each letter in name, if vowel, move the next vowel
# rejoin string
# rejoin last name and then first name to one string
def nextLetter(letter)
  vowels = "aeioua"
  isItVowel = vowels.index(letter)
  if (isItVowel != nil)
    return vowels[vowels.index(letter)+1]
  else
    if (vowels.index(letter.next) != nil)
    return letter.next.next
    elsif (letter.next == "aa")
    return 'b'
    else
    return letter.next
    end
  end
end

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

def nameEncryptorV2(name)
  name.downcase.split(" ").map!{|name| name.split('').map! {|letter| nextLetter(letter)}.join('').capitalize}.reverse.join(" ")
end

secretNames = {}
nameInput= ''
until (nameInput.downcase == 'quit')
  puts "Type in a name or quit"
  nameInput=gets.chomp.split(' ').map!{|name| name.capitalize}.join(" ")
  if (nameInput.downcase !='quit')
  secretNames[nameInput] = nameEncryptorV2(nameInput)
  puts secretNames[nameInput]
  end
end

secretNames.each {|name,secretName|
 puts "#{secretName} is actually #{name}"
}

