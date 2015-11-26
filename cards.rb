
card_suits = {:clubs => "Clubs", :diamonds => "Diamonds", :hearts => "Hearts", :spades => "Spades"}

card_facevalues = {
  :ace => 'Ace',
  :two => 'Two',
  :three => 'Three',
  :four => 'Four',
  :five => 'Five',
  :six => 'Six',
  :seven => 'Seven',
  :eight => 'Eight',
  :nine => 'Nine',
  :ten => 'Ten',
  :jack => 'Jack',
  :queen => 'Queen',
  :king => 'King'
}

=begin
card_suits = [:clubs, :diamonds, :hearts, :spades]

card_facevalues = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
=end

class Card

  attr_accessor :suit, :facevalue

  def initialize(suit, facevalue)
  	self.suit = suit
  	self.facevalue = facevalue
  end
  
  def self.random_card(suit, facevalue)
    Card.new(suit.values[rand(suit.size)], facevalue.values[rand(facevalue.size)])
  end
end

class Deck

  attr_accessor :card_suit, :card_facevalue
  def initialize(card_suit, card_facevalue)

    @deck = []

    card_suit.each do |i|
      card_facevalue.each do |j|
        @deck << Card.new(i, j)
      end
    end 
  end

  def shuffle
    @deck.shuffle!
  end

  def deal
    z = @deck.shift
    puts z.suit
  end

end

card = Card.random_card(card_suits, card_facevalues)
deck = Deck.new(card_suits, card_facevalues)

#puts deck.inspect

#deck.shuffle


s = 0
while s <= 52
  puts s
  deck.deal
  s += 1
end


puts card.inspect
puts "#{card.facevalue} of #{card.suit}"




