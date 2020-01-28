require_relative 'player'

class Game
  attr_accessor :human_player, :ennemies
  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @ennemies = []
    4.times do |i|
      @ennemies.push(Player.new("player#{i}"))
    end
  end

  def kill_player(player)
    if ennemies.index(player) != nil
      ennemies.delete_at(ennemies.index(player))
    end
  end

  def is_still_ongoing?
    ennemy_alive = false
    ennemies.each do |i|
      if i.is_alive?
        ennemy_alive= true
      end
    end
    return ennemy_alive && @human_player.is_alive?
  end

  def show_players
    @human_player.show_state
    puts "nombre d'ennemis: #{ennemies.count}"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    
    puts "attaquer un joueur en vue :"
    ennemies.count.times do |i|
      print "#{i} "
      print "#{ennemies[i].show_state}"
    end
  end

  def menu_choice(choice)
    case choice
      when 'a' then human_player.search_weapon
      when 's' then human_player.search_health_pack
      else  
        human_player.attacks(ennemies[choice.to_i])
        if (ennemies[choice.to_i].is_alive? == false)
          then kill_player(ennemies[choice.to_i])
        end
    end   
  end

  def ennemies_attack
    ennemies.each do |i|
      i.attacks(@human_player)
    end
  end
  
  def end_game
    puts "end of the game"
    if @human_player.is_alive?
      puts "Tu as gagné"
    else 
      puts "tu as perdu"
    end
  end
end