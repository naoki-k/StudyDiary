module Helpers
  def valid_all(args)
    args.all?(&:valid?)
  end

  def invalid_all(args)
    !args.any?(&:valid?)
  end
end
