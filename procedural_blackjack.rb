
def calculate_total(cards)
  #a.map{|e| e|0|}, 0 returns first card
  arr = cards.map{|e| e[0]}

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      #note if card is not num, it returns 0
      total = total + 10
    else
      total += value.to_i
    end
  end
  #correct for Aces
  arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end
  #if arr.include?("Ace") && total > 21
  #  total -= 10
  #end
  total
end


puts '----- Welcome to Blackjack -----'
puts 'What is your first name?'
player_name = gets.chomp

#Create Player and Dealer hands
player_hand = []
dealer_hand = []

#Setup Cards
arr_cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
arr_suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
#Create Deck and Shuffle
arr_deck = arr_cards.product(arr_suits).shuffle!

#Deal Cards
player_hand << arr_deck.pop
dealer_hand << arr_deck.pop
player_hand << arr_deck.pop
dealer_hand << arr_deck.pop

player_total = calculate_total(player_hand)
dealer_total = calculate_total(dealer_hand[1])

#Display player hand to player
puts "#{player_name}, you have the #{player_hand[0][0]} of #{player_hand[0][1]}
and the #{player_hand[1][0]} of #{player_hand[1][1]}, for a total of #{player_total}"

puts ""

#calculate_total(dealer_hand)
puts "The dealers has the #{dealer_hand[0][0]} of #{dealer_hand[0][1]},
and the #{dealer_hand[1][0]} of #{dealer_hand[1][1]}, for a total of #{dealer_total}."
puts ""

#player turn
if player_total == 21
  puts "Congrats, you hit Blackjack, you win!!!"
  exit
end
while player_total < 21
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp
  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == '2'
    break
  end

  new_card = arr_deck.pop
  puts "Dealing card to player: #{new_card}"
  player_hand << new_card
  player_total = calculate_total(player_hand)
  puts "Your total is now: #{player_total}"

  if player_total == 21
    puts "Congrats, you hit Blackjack, you win!!!"
    exit
  elsif player_total > 21
    puts "Sorry, you busted!"
    exit
  end
end

#Dealer turn
if dealer_total == 21
  puts "Sorry, the dealer hit Blackjack"
  exit
end

while dealer_total < 17
  #hit
  new_card = arr_deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealer_hand << new_card
  dealer_total = calculate_total(dealer_hand)
  puts "Dealer total is now #{dealer_total}"

  if dealer_total == 21
    puts "Sorry, dealer hit black. You lose!"
    exit
  elsif dealer_total > 21
    puts "Congrats the dealer busted. You win!"
    exit
  end
end

puts "Dealer's cards: "
dealer_hand.each do |card|
  puts "=> #{card}"
end
puts ""
puts "Player cards: "
player_hand.each do |card|
  puts "=> #{card}"
end

if dealer_total > player_total
  puts "Sorry, the dealer won!"
elsif dealer_total < player_total
  puts "Congrats you win!"
else
  puts "It is a tie!"
  exit
end