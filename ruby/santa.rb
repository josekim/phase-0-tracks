class Santa
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

  def gender=(new_gender)
  @gender = new_gender
  end

  def age
   @age
  end

  def ethnicity
  @ethnicity
  end

end




############## Driver ###############
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