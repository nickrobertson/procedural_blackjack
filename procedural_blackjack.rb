puts '----- Welcome to Blackjack -----'
puts 'What is your first name?'
player_name = gets.chomp

#Create Player and Dealer hands
player_hand = []
dealer_hand = []

#Setup Cards
arr_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
arr_suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
#Create Deck and Shuffle
arr_deck = arr_cards.product(arr_suits).shuffle!

#Deal Cards
player_hand << arr_deck.pop
dealer_hand << arr_deck.pop
player_hand << arr_deck.pop
dealer_hand << arr_deck.pop

#method to display cards nicely

#Display player hand to player
p player_hand
#Display second card of dealer hand
p dealer_hand
p dealer_hand[1]