class Property

  include Comparable
  attr_reader :comparison_type, :value

  def initialize(name, value, comparison_type)
    @name = name
    @value = value
    @comparison_type = comparison_type
  end

  def self.higher_better_property(name, value)
    Property.new(name, value, :hb)
  end

  def self.lower_better_property(name, value)
    Property.new(name, value, :lb)
  end

  def <=>(other)
    return value - other.value if @comparison_type == :hb
    return other.value - value if @comparison_type == :lb
  end
end