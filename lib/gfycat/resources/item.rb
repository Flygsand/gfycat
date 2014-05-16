module Gfycat
  module Resources

    class Item
      include Virtus.model
      include Gfycat::Attributes

      attribute :gfy_id, String
      attribute :gfy_name, String
      attribute :gfy_number, Integer
      attribute :user_name, String
      attribute :width, Integer
      attribute :height, Integer
      attribute :frame_rate, Integer
      attribute :num_frames, Integer
      attribute :mp4_url, Uri
      attribute :webm_url, Uri
      attribute :gif_url, Uri
      attribute :gif_size, Integer
      attribute :mp4_size, Integer
      attribute :webm_size, Integer
      attribute :create_date, DateTime
      attribute :views, Integer
      attribute :title, String
      attribute :extra_lemmas, String
      attribute :md5, String
      attribute :tags, String
      attribute :nsfw, Boolean
      attribute :sar, String
      attribute :url, Uri
      attribute :source, Enum[:unknown]
      attribute :dynamo, String
      attribute :subreddit, String
      attribute :reddit_id, Integer
      attribute :reddit_id_text, String
      attribute :upload_gif_name, String

    end

  end
end