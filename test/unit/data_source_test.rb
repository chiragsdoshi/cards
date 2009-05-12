require File.dirname(__FILE__) + '/../test_helper.rb'

Expectations do

  expect 1 do
    datasource = DataSource.new("#{RAILS_ROOT}/test/fixtures/one_row.csv")
    datasource.rows.size
  end

  expect 2 do
    datasource = DataSource.new("#{RAILS_ROOT}/test/fixtures/test.csv")
    datasource.rows.size
  end

  expect 4 do
    datasource = DataSource.new("#{RAILS_ROOT}/test/fixtures/test.csv")
    datasource.property_names.size
  end

  expect 'matches' do
    datasource = DataSource.new("#{RAILS_ROOT}/test/fixtures/test.csv")
    datasource.property_names[0]
  end

  expect 5 do
    datasource = DataSource.new("#{RAILS_ROOT}/test/fixtures/test.csv")
    datasource.property_types.size
  end

end