require "securerandom"
require "cgi"
require "virtus"
require "virtus/uri"
require "faraday"
require "faraday_middleware"

require "gfycat/version"
require "gfycat/middleware"
require "gfycat/patches"

module Gfycat
  autoload :Attributes, "gfycat/attributes"
  autoload :Client, "gfycat/client"
  autoload :JsonClient, "gfycat/json_client"
  autoload :Resources, "gfycat/resources"
end
