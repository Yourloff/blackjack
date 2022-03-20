class Game
  attr_accessor :status
  def initialize
    @deck = Deck.set_deck
    @status = true
  end

  def self.start_game(player, dealer)
    2.times do
      player.hit
      dealer.hit
    end
  end

  def self.win?(player, dealer)
    player_score = player.score
    dealer_score = dealer.score

    if player_score != 0 && dealer_score != 0
      if player_score > 21 && dealer_score <= 21
        'У вас перебор. Дилер победил'
      elsif player_score <= 21 && dealer_score > 21
        'У дилера перебор. Вы победили!'
      elsif player_score > 21 && dealer_score > 21
        'У всех перебор'
      elsif player_score > dealer_score
        'Вы победили!'
      elsif player_score < dealer_score
        'Дилер победил'
      elsif player_score == dealer_score
        'Ничья'
      end
    end
  end

  # получить карту из общей колоды
  def get_card
    unless count_cards == 0
      pick_card = @deck.sample
      @deck.delete(pick_card)
      pick_card
    end
  end

  # количество карт в колоде
  def count_cards
    @deck.size
  end

  # очки имеющихся карт на руке
  def total_score(hand)
    total = 0
    hand.each do |card|
      case card.chop
      when 'A' then total >= 11 ? total += 1 : total += 11
      when 'J', 'Q', 'K' then total += 10
      else
        total += card.to_i
      end
    end
    total
  end
end
