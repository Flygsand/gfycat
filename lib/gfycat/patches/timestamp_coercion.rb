require "coercible"

class Coercible::Coercer::String

  def parse_value(parser, value, method)
    parser.strptime(value, "%s")
  rescue ArgumentError
    raise_unsupported_coercion(value, method)
  end

end