class Player
  attr_reader :name, :hand, :score

  def initialize(name, game)
    @name = name
    @game = game
    @score = 0
    @hand = []
  end

  def hit
    @hand << @game.get_card if @score < 21
    score
  end

  def score
    @score = @game.total_score(@hand)
  end
end
