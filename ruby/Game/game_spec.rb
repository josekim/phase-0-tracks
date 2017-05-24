require_relative "game"

describe Game do
  let(:game) { Game.new("New Password") }

  it "Secret Password Initialized" do
    expect(game.password).to eq "New Password"
  end

  it "Number of Guesses initialized" do
    expect(game.number_of_guesses).to eq 11
  end

  it "phrase parsed to Blank" do
    expect(game.get_phrase).to eq "_ _ _   _ _ _ _ _ _ _ _"
  end

  it "Guessing with Letters" do
    game.guess("s")
    game.guess("z")
    game.guess("u")
    expect(game.get_phrase).to eq "_ _ _   _ _ s s _ _ _ _"
  end

  it "Deal with Same Letter" do
    game.guess("s")
    game.guess("s")
    game.guess("s")
    game.guess("s")
    expect(game.number_of_guesses).to eq 10
  end

  it "Guessing counter increments" do
    game.guess("s")
    expect(game.number_of_guesses).to eq 10
    game.guess("s")
    expect(game.number_of_guesses).to eq 10
    game.guess("z")
    expect(game.number_of_guesses).to eq 9
    game.guess("u")
    expect(game.number_of_guesses).to eq 8
    game.guess("a")
    expect(game.number_of_guesses).to eq 7
    game.guess("b")
    expect(game.number_of_guesses).to eq 6
    game.guess("c")
    expect(game.number_of_guesses).to eq 5
    game.guess("d")
    expect(game.number_of_guesses).to eq 4
    game.guess("e")
    expect(game.number_of_guesses).to eq 3
    game.guess("f")
    expect(game.number_of_guesses).to eq 2
    game.guess("h")
    expect(game.number_of_guesses).to eq 1
    game.guess("i")
    expect(game.number_of_guesses).to eq 0
    game.guess("j")
    expect(game.number_of_guesses).to eq -1
  end

  it "Guessed Right Word?" do
    expect(game.guessed_right_word?("New Password")).to eq true
  end

  it "Guessed wrong Word?" do
    expect(game.guessed_right_word?("New Pssword")).to eq false
  end


  it "Win by finding all letters" do
    game.guess("p")
    game.guess("a")
    game.guess("s")
    game.guess("w")
    game.guess("r")
    game.guess("o")
    game.guess("e")
    game.guess("n")
    game.guess("d")
    expect(game.win?).to eq true
    expect(game.continue).to eq false
  end

  it " Win by finding the correct word" do
    game.guess("new Password")
    expect(game.win?).to eq true
    expect(game.continue).to eq false
  end

  it "lose by no continue" do
    game.guess("a")
    game.guess("z")
    game.guess("y")
    game.guess("x")
    game.guess("w")
    game.guess("t")
    game.guess("u")
    game.guess("v")
    game.guess("f")
    game.guess("l")
    game.guess("asdfoi")
    game.guess("dfoi")
    expect(game.win?).to eq false
    expect(game.continue).to eq false
  end
end