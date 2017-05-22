class Santa
  attr_reader :age,:ethnicity
  attr_accessor :gender,
  def initialize(gender, ethnicity)
   puts "Initializing Santa instance..."
   @gender = gender
   @ethnicity = ethnicity
   @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
   @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    index = @reindeer_ranking.index(reindeer)
    last = @reindeer_ranking.slice!(index)
    @reindeer_ranking.push(last)
  end
=begin
  def gender=(new_gender)
  @gender = new_gender
  end

  def age
   @age
  end

  def ethnicity
  @ethnicity
  end
=end
end




############## Driver ###############
=begin
santas = []
person = {
  person1: {
    gender: "male",
    ethnicity: "black"},
  person2: {
    gender: "female",
    ethnicity: "white"},
  person3: {
    gender: "male",
    ethnicity: "latino"},
  person4: {
    gender: "female",
    ethnicity: "asian"},
  person5: {
    gender: "female",
    ethnicity: "japanese"},
  person6: {
    gender: "male",
    ethnicity: "italian"},
  person7: {
    gender: "male",
    ethnicity: "greek"},
  person8: {
    gender: "male",
    ethnicity: "chinese"},
  person9: {
    gender: "female",
    ethnicity: "swedish"}
}
person.each {|person,attributes|
  santas << Santa.new(attributes[:gender],attributes[:ethnicity])
}

santas.each {|santa|
  santa.speak
  santa.celebrate_birthday
  santa.get_mad_at("Dasher")
  santa.gender = "male"
  p santa.ethnicity
  p santa.age
}
=end

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]


for i in 1..1000000
  new_santa = Santa.new(example_genders.sample,example_ethnicities.sample)
  p new_santa.age = rand(141)
  p new_santa.gender
  p new_santa.ethnicity
  p new_santa.reindeer_ranking
end
