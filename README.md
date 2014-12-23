# Gfycat

A Ruby interface to the Gfycat API.

## Installation

Add this line to your application's Gemfile:

    gem "gfycat"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gfycat

## Usage

### Transcoding from a remote source

```irb
2.1.0 :001 > require "gfycat"
 => true
2.1.0 :002 > client = Gfycat::Client.new
 => #<Gfycat::Client:0x0000010120ca68 @client=#<Gfycat::JsonClient:0x000001011fc1e0 @conn=#<Faraday::Connection:0x000001011ffdb8 @parallel_manager=nil, @headers={"User-Agent"=>"Faraday v0.9.0"}, @params={}, @options=#<Faraday::RequestOptions (empty)>, @ssl=#<Faraday::SSLOptions (empty)>, @default_parallel_manager=nil, @builder=#<Faraday::RackBuilder:0x000001011f75c8 @handlers=[Gfycat::Middleware::Response::SnakeCaseKeys, FaradayMiddleware::ParseJson, Faraday::Adapter::NetHttp]>, @url_prefix=#<URI::HTTP:0x000001011f7028 URL:http://gfycat.com/cajax>, @proxy=nil>>>
2.1.0 :003 > name = client.transcode!("http://24.media.tumblr.com/tumblr_mdtean9phV1rkbqbko1_500.gif")
 => "SilkyCarelessAmericanbobtail"
2.1.0 :004 > client.get(name)
 => #<Gfycat::Resources::Item:0x00000101575628 @gfy_id="silkycarelessamericanbobtail", @gfy_name="SilkyCarelessAmericanbobtail", @gfy_number=407030074, @user_name="anonymous", @width=502, @height=282, @frame_rate=10, @num_frames=15, @mp4_url=#<URI::HTTP:0x0000010157e480 URL:http://zippy.gfycat.com/SilkyCarelessAmericanbobtail.mp4>, @webm_url=#<URI::HTTP:0x0000010157e160 URL:http://zippy.gfycat.com/SilkyCarelessAmericanbobtail.webm>, @gif_url=#<URI::HTTP:0x0000010157de40 URL:http://zippy.gfycat.com/SilkyCarelessAmericanbobtail.gif>, @gif_size=504554, @mp4_size=168339, @webm_size=181618, @create_date=#<DateTime: 2014-05-16T13:51:21+00:00 ((2456794j,49881s,0n),+0s,2299161j)>, @views=1, @title=nil, @extra_lemmas=nil, @md5=nil, @tags=nil, @nsfw=nil, @sar=nil, @url=#<URI::HTTP:0x0000010157c9f0 URL:http://24.media.tumblr.com/tumblr_mdtean9phV1rkbqbko1_500.gif>, @source=nil, @dynamo=nil, @subreddit=nil, @reddit_id=nil, @reddit_id_text=nil, @upload_gif_name=nil>
2.1.0 :005 > client.exists?("http://24.media.tumblr.com/tumblr_mdtean9phV1rkbqbko1_500.gif")
 => true
```

### Transcoding from a file upload

```irb
irb(main):001:0> require "gfycat"
=> true
irb(main):002:0> client = Gfycat::Client.new
=> #<Gfycat::Client:0x007f87ec3e05a0 @client=#<Gfycat::JsonClient:0x007f87ec3d2590 @conn=#<Faraday::Connection:0x007f87ec3d23b0 @parallel_manager=nil, @headers={"User-Agent"=>"Faraday v0.9.0"}, @params={}, @options=#<Faraday::RequestOptions (empty)>, @ssl=#<Faraday::SSLOptions (empty)>, @default_parallel_manager=nil, @builder=#<Faraday::RackBuilder:0x007f87ec3d1eb0 @handlers=[Faraday::Request::Multipart, Faraday::Request::UrlEncoded, Gfycat::Middleware::Response::SnakeCaseKeys, FaradayMiddleware::ParseJson, Faraday::Adapter::NetHttp]>, @url_prefix=#<URI::HTTP:0x007f87ec3d1898 URL:http://gfycat.com/cajax>, @proxy=nil>>>
irb(main):003:0> name = client.upload(File.new('/Users/giles/test.avi'))
=> "21afe455c0"
irb(main):004:0> client.transcode_upload!(name)
=> "SilkyCarelessAmericanbobtail"
irb(main):005:0> client.upload_and_transcode(File.new('/Users/giles/test.avi'))
=> "SilkyCarelessAmericanbobtail"
```

## Contributing

1. Fork it ( http://github.com/protomouse/gfycat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
