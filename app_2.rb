require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "Prénom du joueur"
player_name = gets.chomp

human_player= HumanPlayer.new(player_name.to_s)

jose = Player.new("Jose")
josiane = Player.new("Josiane")

enemies = [jose, josiane]

while human_player.is_alive? && (jose.is_alive? || josiane.is_alive?) 
  puts "Quelle action veux-tu effectuer ?"

  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  
  puts "attaquer un joueur en vue :"
  print "0 - "
  josiane.show_state
  print "1 - "
  jose.show_state

  choice = gets.chomp
  case choice
    when 'a' then human_player.search_weapon
    when 's' then human_player.search_health_pack
    when '0' then human_player.attacks(josiane)
    when '1' then human_player.attacks(jose)
  end
  puts "Les autres joueurs t'attaquent !"

  enemies.each do |enemy|
    if enemy.is_alive?
      enemy.attacks(human_player)
    end
  end
end

puts "La partie est finie"
if human_player.is_alive?
  puts "tu as gagné"
else
  puts "tu as perdu"
end
