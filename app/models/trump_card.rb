class TrumpCard

  include Comparable   

  attr_reader :properties

  def initialize(properties)
    @properties = {}
    properties.collect do |property|
      @properties[property.name] = property
    end
  end

  def wins_with?(other, property)
    return @properties[property] > other.properties[property]
  end

  def to_s
    "TrumpCard: #{properties.values.collect {|p| p.to_s}.join(', ') }"
  end

end