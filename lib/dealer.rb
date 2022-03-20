class Dealer < Player
  attr_reader :name, :hand, :score

  def initialize(name, game)
    @name = name
    @game = game
    @score = 0
    @hand = []
  end

  def hit
    while @score < 17
      @hand << @game.get_card
      score
    end
  end

  def score
    @score = @game.total_score(@hand)
  end

end
