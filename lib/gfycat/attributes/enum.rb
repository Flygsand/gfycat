module Gfycat
  module Attributes

    class Enum
      def self.[](*values)
        class_name = self.name

        Class.new(Virtus::Attribute) do
          define_singleton_method :inspect do
            sprintf("#<%s%s>", class_name, values)
          end

          define_method :coerce do |value|
            value && values[value.to_i]
          end
        end
      end
    end

  end
end