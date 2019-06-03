module Helpers
  def valid_all(args)
    args.each do |target|
      return false unless target.valid?
    end
    return true
  end

  def invalid_all(args)
    args.each do |target|
      return false if target.valid?
    end
    return true
  end
end
