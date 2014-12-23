module Gfycat

  class JsonClient

    def initialize(url, options = {})
      options = options.dup

      @conn = Faraday.new(url: url) do |conn|
        conn.request :multipart
        conn.request :url_encoded

        conn.response :snake_case_keys
        conn.response :json, content_type: /\bjson$/

        conn.options.update(options)

        conn.adapter Faraday.default_adapter
      end
    end

    def get(path, params = {})
      @conn.get(path, params).body
    end

    def post(path, params = {})
      @conn.post(path, params)
    end

  end

end