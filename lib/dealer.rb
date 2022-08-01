class Dealer < Player

  def initialize(name, game)
    super
  end

  def hit
    while @score < 17
      @hand << @game.get_card
      score
    end
  end
end
