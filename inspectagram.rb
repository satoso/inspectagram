require 'instagram'
require 'sinatra'
require 'haml'
require 'sass'

CLIENT_ID = 'dummydummydummy'

Instagram.configure do |config|
  config.client_id = CLIENT_ID
end

set :haml, :format => :html5

get "/" do
  'Hello, world!'
end

get "/p/:instagram_code/" do |code|
  media_id = Instagram.oembed(gen_url(code))[:media_id]
  @api_media = Instagram.media_item(media_id)
  @link_thumb  = @api_media.link + 'media/?size=t'
  @link_medium = @api_media.link + 'media/?size=m'
  @link_large  = @api_media.link + 'media/?size=l'
  @title = code
  haml :result
end

get "/default.css" do
  scss :default, :style => :expanded
end

def gen_url(code)
  "http://instagram.com/p/#{code}/"
end


__END__
if __FILE__ == $PROGRAM_NAME
  begin
    oembed = Instagram.oembed("http://instagram.com/p/c3g8jtyLpa/")
    p oembed
    p oembed[:media_id]
    media = Instagram.media_item(oembed[:media_id])
    p media
    oembed2 = Instagram.oembed("http://instagram.com/p/test/")
    p oembed2
  rescue
    puts "error"
  end
end



