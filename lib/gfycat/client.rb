module Gfycat

  class Client

    def initialize(options = {})
      @client = JsonClient.new(api_url, **options)
    end

    def transcode!(source)
      response = @client.get(transcode_url, fetchUrl: source)
      response["gfy_name"]
    end

    def get(name)
      response = @client.get("get/#{name}")
      Resources::Item.new(response["gfy_item"])
    end

    def exists?(url)
      response = @client.get("checkUrl/#{CGI::escape(url)}")
      !!response["url_known"]
    end

    protected
    def api_url
      "http://gfycat.com/cajax"
    end

    def transcode_url
      "http://upload.gfycat.com/transcode/#{SecureRandom.hex(5)}"
    end

  end

end