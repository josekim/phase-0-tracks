
module Shout
=begin
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily()
    "Oh! Happy!"
  end
=end
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily()
    "Oh! Happy!"
  end

end

class Football_Fan
  include Shout
end

class Baseball_Fan
  include Shout
end


############################################
football_fan = Football_Fan.new
baseball_fan = Baseball_Fan.new

p football_fan.yell_angrily("CATCH THE BALL")
p football_fan.yelling_happily
p baseball_fan.yell_angrily("HIT THE BALL")
p baseball_fan.yelling_happily