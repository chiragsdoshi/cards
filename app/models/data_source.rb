class DataSource

  def initialize(path)
    arr_of_arrs = FasterCSV.read(path)
    @property_names = property_names_from(arr_of_arrs[0])
    @property_types = arr_of_arrs[1]
    @rows = arr_of_arrs[2..arr_of_arrs.size]
    create_factory
  end

  def rows
    @rows
  end

  def property_names
    @property_names
  end

  def property_types
    @property_types
  end
  
  def cards
    @rows.collect do |row|
      create_card(row, @property_names)
    end
  end

  private

  def property_names_from(row)
    prop_names =[]
    1.upto(row.length - 1) do |i|
      prop_names << row[i].strip
    end
    prop_names
  end

  def create_card(row, property_names)
    hash = {}
    property_names.size.times do |i|
      hash[property_names[i].strip.to_sym] = row[i+1].strip
    end

    name = row[0].strip
    @factory.create_card(hash, name)
  end

  def create_factory
    hash = {}
    property_names.size.times do |i|
      hash[property_names[i].strip.to_sym] = property_types[i+1].strip.to_sym
    end

    @factory ||= TrumpCardFactory.new(hash)
  end
  
  
end