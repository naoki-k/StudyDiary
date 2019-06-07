RSpec::Matchers.define :valid_all_values do |values|
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
end

RSpec::Matchers.define :invalid_all_values do |values|
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
end
