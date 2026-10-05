struct Destination
  getter name : String

  def initialize(@name : String)
  end

  def self.all : Array(Destination)
    [
      Destination.new(
        name: "Aeroporto Porto Seguro"
      ),
      Destination.new(
        name: "Trancoso"
      ),
      Destination.new(
        name: "Arraial d'Ajuda"
      ),
      Destination.new(
        name: "Caraíva"
      ),
      Destination.new(
        name: "Santo André"
      ),
      Destination.new(
        name: "Club Med Trancoso"
      ),
      Destination.new(
        name: "Taípe"
      ),
    ]
  end
end
