class TrumpCardFactory

  def initialize(property_definitions)
    @property_definitions = property_definitions 
  end

  def create_card(property_values)

    TrumpCard.new(properties_hash_for property_values)
  end

  private
  
  def properties_hash_for(property_values)
    properties = {}
        @property_definitions.each  do |name, type|
          properties[name] = Property.new(name, property_values[name], type)
        end
    properties    
  end
  
end