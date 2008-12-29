class TrumpCardFactory

  def initialize(property_definitions)
    @property_definitions = property_definitions 
  end

  def create_card(property_values)

    properties = @property_definitions.collect  do |name, type|
      Property.new(name, property_values[name], type)
    end
    TrumpCard.new(properties)
  end
end