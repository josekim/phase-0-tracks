# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Require_Relative is pulling the data from another file in the same Directory
# Require looks in certain folders via absolute path or ruby libraries/gems
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # virus_effect - Running predicted_deaths and speed_of_spread - Public method
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
  # Predicts death as percentage of population at different population density thresholds
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      rate = 0.4
    elsif @population_density >= 150
      rate = 0.3
    elsif @population_density >= 100
      rate = 0.2
    elsif @population_density >= 50
      rate = 0.1
    else
      rate = 0.05
    end
    number_of_deaths = (@population * rate).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Predicts the number of months for disease to spread using population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

STATE_DATA.each do |state, population_hash|
  new_state = VirusPredictor.new(state, population_hash[:population_density], population_hash[:population])
  new_state.virus_effects
end

#======================================================================
=begin
# Reflection Section
What are the differences between the two different hash syntaxes shown in the state_data file?
  One uses the actual string as the key, The other uses a symbol.  Its helpful since the string is more presentable and more easilty used to present the data

What does require_relative do? How is it different from require?
  Require's a file that is in the relative path, as in the same directory.  Require is able to specify where its being require from, like absolute path, or through library or gem

What are some ways to iterate through a hash?
  Use the each method, each_key,

When refactoring virus_effects, what stood out to you about the variables, if anything?
  Sometimes you know what is being repeated, but not quite sure how to get rid of what is being Repeated.

What concept did you most solidify in this challenge?
  I think i'm okay with most concetps, need to work on Refactoring.





=end