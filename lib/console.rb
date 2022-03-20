class Console
  # очистить консоль
  def self.clear
    if RUBY_PLATFORM =~ /mswin/i
      system('cls')
    else
      system('clear')
    end
  end

  # меню игрока
  def self.menu(player, dealer)
    result = Game.win?(player, dealer)

    clear

    puts <<~END
      Игрок: #{dealer.name}
      Очки: #{dealer.score}
      Карты: #{dealer.hand}

      Игрок: #{player.name}
      Очки: #{player.score}
      Карты: #{player.hand}
    END

    if result.nil?
      puts "[H]it. Взять карту      [S]tand. Остановиться      [Q]uit. Закончить игру"
    else
      puts
      puts result
      puts
      puts '[R]estart. Начать новую игру      [Q]uit. Закончить игру'
    end
  end
end
