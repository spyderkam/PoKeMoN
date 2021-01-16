#!/usr/bin/env ruby

require_relative "database"

pool = ["Magikarp", "Pidgey", "Krabby", "Rattata", "Onix"]

puts 'Pokemon Pool: ' + pool.to_s
puts ''
puts 'Please select a Pokemon from the pool apart from Onix'
loop do
  $starter = gets.chomp.capitalize
  break if pool.any?($starter) && $starter != "Onix"
  puts 'Please select a Pokemon from the pool apart from Onix'
end

puts ''
puts "Now two other random Pokemon from the pool will be added to your squad."
pool.delete($starter)
$rand1 = pool.sample
pool.delete($rand1)
$rand2 = pool.sample
#pool.delete(rand2)
$squad.push($starter, $rand1, $rand2)
puts "Your squad is " + $squad.to_s

puts ''
puts "Now to face the gym leader. Which Pokemon would you like to send out first?"

first_poke = gets.chomp.capitalize
loop do
  break if $squad.any?(first_poke)
  puts "Please select a Pokemon from your squad."
end

puts ''
puts "The gym leader sends out #{opponent = $gym_leader.sample}."

puts ''
$pokedex.each { |key, value|
  if $pokedex[opponent] > $pokedex[first_poke]
    return puts "#{first_poke} is unable to battle. The gym leader wins." #return vs break
  elsif $pokedex[opponent] < $pokedex[first_poke]
    return puts "#{opponent} is unable to battle. You win."
  else return puts "draw"
  end
}
