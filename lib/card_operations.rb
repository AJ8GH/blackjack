module BlackJack
  module CardOperations
    def get_card
      self.card = dealer.deal
    end

    def assign_card(person)
      person.hand << card
    end

    def deal_card_to(person)
      get_card
      assign_card(person)
    end

    def initial_deal(person)
      2.times { get_card; assign_card(person) }
    end

    def show_hand(person)
      puts hand_intro(person)
      puts person.hand.map { |card| card_name(card) }
    end

    def show_dealer_hand
      puts hand_intro(dealer)
      puts card_name(dealer.hand.first)
      puts "* Hidden *".cardify
    end

    def hand_intro(person)
      person.class == Player ? "\nYour hand:" : "Dealer:"
    end

    def card_name(card)
      value, suit = [card.value, card.suit].map { |name| convert_card_names(name) }
      "#{value} #{suit_symbol(card)} #{suit}".cardify
    end

    def suit_symbol(card)
      card.suit == :spades ? '♤' :
      card.suit == :hearts ? '♥︎' :
      card.suit == :clubs ? '♧' : '♦︎'
    end

    def convert_card_names(name)
      name.to_s.capitalize
    end
  end
end
