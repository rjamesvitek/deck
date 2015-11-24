
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

end

class Deck

  attr_accessor :card_suit, :card_facevalue
  def initialize(card_suit, card_facevalue)

    @deck = []

    card_suit.each do |i|
      card_facevalue.each do |j|
        @card = Card.new(i, j)
        @deck << [@card]
      end
    end 
  end

  def shuffle
    @deck.shuffle!
  end

  def deal
    z = @deck.first
    puts z.inspect
    @deck.delete(z)
  end
end

test = Deck.new(card_suits, card_facevalues)

#puts test.inspect

#test.shuffle


s = 0
while s <= 52
  puts s
  test.deal
  s += 1
end


=begin
card = Card.new(card_suits.values[rand(card_suits.size)], card_facevalues.values[rand(card_facevalues.size)])
puts "#{card.facevalue} of #{card.suit}"
=end