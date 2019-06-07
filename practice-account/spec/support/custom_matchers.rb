module CustomMatchers
  module ValidHelper
    RSpec::Matchers.define :accept_all do |values|
      match do |model|
        return false if @column.blank?
    
        values.all? do |value|
          model[@column] = value
          model.valid?
        end
      end
    
      chain :column do |column|
        @column = column
      end

      description do
        "be accept all attributes"
      end
    end
    
    RSpec::Matchers.define :reject_all do |values|
      match do |model|
        return false if @column.blank?
    
        values.none? do |value|
          model[@column] = value
          model.valid?
        end
      end
    
      chain :column do |column|
        @column = column
      end

      description do
        "be reject all attributes"
      end
    end
  end
end
