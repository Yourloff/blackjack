require_relative 'lib/deck'
require_relative 'lib/game'
require_relative 'lib/console'
require_relative 'lib/player'
require_relative 'lib/dealer'

puts 'Добро пожаловать в игру BlackJack'

choice = nil
game = Game.new
player = Player.new('Alexey', game)
dealer = Dealer.new('Дилер', game)

until choice == 'q'

  Console.menu(player, dealer)

  choice = STDIN.gets.chomp

  unless game.status
    case choice.downcase
    when 'r'
      game = Game.new
      player = Player.new('Alexey', game)
      dealer = Dealer.new('Дилер', game)
      game.status = true
    when 'q'
      puts 'bye!'
      exit
    else
      puts 'Такой команды нет'
    end
  else
    case choice
    when 'h'
      player.hit
    when 's'
      dealer.hit
      game.status = false
    when 'q'
      puts 'bye!'
      exit
    else
      puts 'Такой команды нет'
    end
  end
end
