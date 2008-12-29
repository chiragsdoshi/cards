class TrumpCard

  include Comparable   

  attr_reader :properties

  def initialize(properties)
    @properties = properties
  end

  def wins_with?(other, property)
    return @properties[property] > other.properties[property]
  end

end