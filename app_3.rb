require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Prénom du joueur"
player_name = gets.chomp

my_game= Game.new(player_name.to_s)

while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.ennemies_attack
end

my_game.end_game