require 'rspec/expectations'

RSpec::Matchers.define :valid_all_values do |values|
  match do |model|
    all_valid?()
  end

  chain :column do |column|
    @column = column
  end

  failure_message do |actual|

  end

  def all_valid?(model, values)
    
  end
end
