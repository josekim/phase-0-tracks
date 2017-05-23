module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily()
    "Oh! Happy!"
  end

end

p Shout.yelling_happily
p Shout.yell_angrily("EHHH")