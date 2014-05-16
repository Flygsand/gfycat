module Gfycat
  module Middleware
    module Response

      class SnakeCaseKeys < Faraday::Middleware

        def call(env)
          @app.call(env).on_complete do |env|
            env[:body] = convert_value(env[:body])
          end
        end

        protected
        def convert_key(key)
          key.to_s.strip.
            gsub(" ", "_").
            gsub(/::/, "/").
            gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
            gsub(/([a-z\d])([A-Z])/, '\1_\2').
            tr("-", "_").
            squeeze("_").
            downcase
        end

        def convert_value(value)
          case value
          when Array
            value.map { |v| convert_value(v) }
          when Hash
            Hash[value.map { |k, v| [convert_key(k), convert_value(v)] }]
          else
            value
          end
        end

      end

    end
  end
end