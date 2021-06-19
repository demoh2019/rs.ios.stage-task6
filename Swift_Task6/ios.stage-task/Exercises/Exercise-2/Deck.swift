import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards:[Card] = []
        for suit in suits{
            for value in values{
                cards.append(Card(suit: suit, value: value))
            }
        }
        
        return cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        trump = cards.first!.suit
        setTrumpCards(for: trump!)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players{
            player.hand = []
            for _ in 1...6{
                player.hand!.append(cards.removeFirst())
            }
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for i in cards.indices{
            if cards[i].suit == trump{
                cards[i].isTrump = true
            }
        }
    }
}

