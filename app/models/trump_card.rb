class TrumpCard

  include Comparable   
  attr_reader :name

  def initialize(properties, name = '')
    @name = name
    @properties = properties
  end

  def beats?(other, property_name)
    return other._beats?(@properties[property_name], property_name)
  end

  def _beats?(property, property_name)
    return property >= @properties[property_name]
  end

  def identified_by?(name)
    @name == name
  end

  def to_s
    "TrumpCard:#{@name} #{@properties.values.collect {|p| p.to_s}.sort.join(', ') }"
  end

end