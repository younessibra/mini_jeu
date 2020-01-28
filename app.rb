require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

player1= Player.new("Jose")
player2= Player.new("Josiane")


while (player1.is_alive? && player2.is_alive?)
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.is_alive? == false
    then break
  end
  player2.attacks(player1)
  puts 
end
binding.pry