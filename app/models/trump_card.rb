class TrumpCard

  include Comparable   

  def initialize(properties)
    @properties = properties
  end

  def beats?(other, property_name)
    return other._beats?(@properties[property_name], property_name)
  end

  def _beats?(property, property_name)
    return property >= @properties[property_name]
  end

  def to_s
    "TrumpCard: #{@properties.values.collect {|p| p.to_s}.sort.join(', ') }"
  end

end