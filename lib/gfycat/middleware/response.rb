module Gfycat
  module Middleware

    module Response
      autoload :SnakeCaseKeys, "gfycat/middleware/response/snake_case_keys"

      Faraday::Response.register_middleware \
        snake_case_keys: lambda { SnakeCaseKeys }
    end

  end
end