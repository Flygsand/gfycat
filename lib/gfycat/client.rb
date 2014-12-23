module Gfycat

  class Client

    def initialize(options = {})
      @client = JsonClient.new(api_url, options)
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

    def upload(file)
      content_type = MIME::Types.of(file.path).first.content_type
      response = @client.post(upload_url,
        'key' => SecureRandom.hex(5),
        'acl' => "private",
        'AWSAccessKeyId' => "AKIAIT4VU4B7G2LQYKZQ",
        'policy' => "eyAiZXhwaXJhdGlvbiI6ICIyMDIwLTEyLTAxVDEyOjAwOjAwLjAwMFoiLAogICAgICAgICAgICAiY29uZGl0aW9ucyI6IFsKICAgICAgICAgICAgeyJidWNrZXQiOiAiZ2lmYWZmZSJ9LAogICAgICAgICAgICBbInN0YXJ0cy13aXRoIiwgIiRrZXkiLCAiIl0sCiAgICAgICAgICAgIHsiYWNsIjogInByaXZhdGUifSwKCSAgICB7InN1Y2Nlc3NfYWN0aW9uX3N0YXR1cyI6ICIyMDAifSwKICAgICAgICAgICAgWyJzdGFydHMtd2l0aCIsICIkQ29udGVudC1UeXBlIiwgIiJdLAogICAgICAgICAgICBbImNvbnRlbnQtbGVuZ3RoLXJhbmdlIiwgMCwgNTI0Mjg4MDAwXQogICAgICAgICAgICBdCiAgICAgICAgICB9",
        'success_action_status' => 200,
        'signature' => "mk9t/U/wRN4/uU01mXfeTe2Kcoc=",
        'Content-Type' => content_type,
        'file' => Faraday::UploadIO.new(file.path, content_type)
      )
      response.headers.to_hash.fetch('location').split('/').last
    end

    def transcode_upload!(name)
      response = @client.get(transcode_url(name))
      response.fetch('gfy_name')
    end

    def upload_and_transcode(file)
      name = upload(file)
      transcode_upload!(name)
    end

    protected
    def api_url
      "http://gfycat.com/cajax"
    end

    def transcode_url(name = nil)
      name ||= SecureRandom.hex(5)
      "http://upload.gfycat.com/transcode/#{name}"
    end

    def upload_url
      "https://gifaffe.s3.amazonaws.com/"
    end

  end

end