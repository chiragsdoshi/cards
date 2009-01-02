class Property

  include Comparable
  
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
    other._spaceship(@value.to_f)
  end

  def _spaceship(other_value)
    return other_value - @value.to_f if @comparison_type == :higher_wins
    return @value.to_f - other_value if @comparison_type == :lower_wins
  end

  def to_s
    @name.to_s.titleize + ' => ' + @value.to_s
  end
end