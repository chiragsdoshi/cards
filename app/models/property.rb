class Property

  include Comparable
  attr_reader :comparison_type, :name, :value

  def initialize(name, value, comparison_type)
    @name = name
    @value = value
    @comparison_type = comparison_type
  end

  def self.higher_wins_property(name, value)
    Property.new(name, value, :higher_wins)
  end

  def self.lower_wins_property(name, value)
    Property.new(name, value, :lower_wins)
  end

  def <=>(other)
    return value - other.value if @comparison_type == :higher_wins
    return other.value - value if @comparison_type == :lower_wins
  end

  def to_s
    name.to_s.titleize + ' => ' + value.to_s 
  end
end