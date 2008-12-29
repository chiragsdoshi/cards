require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do

  expect true do
    Property.higher_better_property(nil, 1000) > Property.higher_better_property(nil, 800)
  end
  
  expect true do
    Property.lower_better_property(nil, 1) > Property.lower_better_property(nil, 2)
  end

end