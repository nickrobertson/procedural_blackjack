
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
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp